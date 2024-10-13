//=============================================================================
Ext.define('Employee', {
    extend: 'Ext.data.Model',
    fields: [{
        name: 'Id',
        type: 'number'
    }, 'name', {
        name: 'types'
    }, {
        name: 'defertimes',
        type: 'number'
    }]
});

Ext.define('resource', {
    extend: 'Ext.data.Model',
    fields: [{ name: 'Id', type: 'number' }, 'resourcename', {
        name: 'resourcentype'
    }, {
        name: 'units',
        type: 'number'
    }]
});

// Generate mock employee data
var data = (function () {
    data = [];
    return data;
})();

var store2 = Ext.create('Ext.data.Store', {
    // destroy the store if the grid is destroyed
    autoDestroy: true,
    model: 'resource',
    proxy: {
        type: 'memory'
    },
    data: data,
    sorters: [{
        property: 'resourcename',
        direction: 'ASC'
    }]
});

// create the Data Store
var store = Ext.create('Ext.data.Store', {
    // destroy the store if the grid is destroyed
    autoDestroy: true,
    model: 'Employee',
    proxy: {
        type: 'memory'
    },
    data: data,
    sorters: [{
        property: 'name',
        direction: 'ASC'
    }]
});

// ====================================================================
var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
    clicksToMoveEditor: 1,
    autoCancel: false
});

var rowEditing2 = Ext.create('Ext.grid.plugin.RowEditing', {
    clicksToMoveEditor: 1,
    autoCancel: false
});

Ext.ns('TakeTop');
Ext.define('TakeTop.AssignmentGrid', {
    extend      : 'Ext.grid.Panel',
    requires    : [
        'Ext.XTemplate',
        'Gnt.data.Calendar',
        'Gnt.widget.calendar.DayEditor',
        'Gnt.widget.calendar.WeekEditor',
        'Gnt.widget.calendar.DatePicker'
    ],
    store: store2,
	bindTaskData: function(dt,g){
	    var rs=g.assignmentStore;
		var me = this;
		me.row = dt;
		if(rs.getCount()>0){
			rs.each(function(r){
				if(r.data['TaskId']==me.row.data.Id){
					var ResourceId=r.data['ResourceId'];
					var Units=r.data['Units'];
					var rname=rs.resourceStore.getById(ResourceId).data.Name;
					
					var newzy=new store2.model({
						Id:ResourceId,
						resourcename:rname,
						units:Units
					});
					
					store2.add(newzy);
					
				}
			});
		}
	},
	
	doInsert:function(g){
		//添加资源
		var ar = this.store.getRange();
		for (var i = 0; i < ar.length; i++) {
			var newAr = new g.assignmentStore.model({
				TaskId: uuid,
				ResourceId: ar[i].data.Id,
				Units: ar[i].data.units
			});

			g.assignmentStore.add(newAr);
		}
	},
	
	doUpdate:function(dt, g){
	    //修改资源
		var ar = this.store.getRange();
		if (g.assignmentStore.getCount() > 0) {
			g.assignmentStore.each(function (a) {
				if (a.data['TaskId'] == dt.data.Id) {
					g.assignmentStore.remove(a);
				}
			});
		}
		for (var i = 0; i < ar.length; i++) {
			var newAr = new g.assignmentStore.model({
				TaskId: dt.data.Id,
				ResourceId: ar[i].data.Id,
				Units: ar[i].data.units
			});

			g.assignmentStore.add(newAr);
		}
	},
	
    columns: [
		{

			header: '资源编号',
			dataIndex: 'Id',
			width: 110
		}, {
			header: '资源名称',
			dataIndex: 'resourcename',
			// width : 220,
			flex: 1,
			editor: {
				xtype: 'combobox',
				//typeAhead : true,
				queryMode: 'local',
				triggerAction: 'all',
				displayField: 'Name',
				valueField: 'Name',
				selectOnTab: true,
				allowBlank: false,
				scope: this,
				listeners: {
					'select': function (co,
							record, index) {
						var tid = record[0].data.Id;
						this.getSelectionModel().getSelection()[0].set("Id", tid);

					}

				}
			}
		},
		{

			header: '单位',
			dataIndex: 'units',
			width: 110,
			renderer: function (value, metaData, record,
					rowIdx, colIdx, store, view) {
				return value + ' %';
			},
			editor: {
				xtype: 'numberfield',
				minValue: 0,
				maxValue: 100
			}
		}
	],

    width: 600,
    height: 200,
    tbar: [{
        text: '新增',
        handler: function () {
            rowEditing2.cancelEdit();

            // Create a model instance
            var r = Ext.create('resource', {
                resourcename: '',
                resourcetype: '',
                units: 100
            });

            store2.insert(0, r);
            rowEditing2.startEdit(0, 0);
        }
    }, {
        itemId: 'removeRs',
        text: '删除',
		scope: this,
        handler: function () {
            var sm = this.getSelectionModel();
            rowEditing2.cancelEdit();
            store2.remove(sm.getSelection());
            if (store2.getCount() > 0) {
                sm.select(0);
            }
        },
        disabled: true
    }],
    plugins: [rowEditing2],
    listeners: {
        'selectionchange': function (view, records) {
            this.down('#removeRs').setDisabled(!records.length);
        }
    }
});


function getJsonStore(taskStore) {

    /*
    * var jsonDataEncode = ""; var records =
    * taskStore.getNewRecords(); for (var i = 0; i <
    * records.length; i++) { datar.push(records[i].data); }
    */
    var datar = new Array();
    var jsonDataEncode = "";

    function bianli(treenode) {

        datar.push(treenode.data);

        for (var i = 0; i < treenode.childNodes.length; i++) {
            bianli(treenode.childNodes[i]);
        }

    }
    bianli(taskStore.tree.getRootNode());
    // jsonDataEncode = Ext.JSON.encode(datar);
    // var js=eval('('+jsonDataEncode+')');
    return datar;
};


Ext.define('TakeTop.TaskGrid', {
	extend : 'Ext.grid.Panel',
	
	store: store,

	id: "pretaskgrid",
	bindTaskData: function(dt, g){
	    var ds=g.dependencyStore;
		var me = this;
		me.row = dt;
		if(ds.getCount() > 0){
			ds.each(function(d){
				if(d.data['To']==me.row.data.Id){
					var tid=d.data['From'];
					if(g.taskStore.getById(tid)){
						var tname=g.taskStore.getById(tid).data.Name;
						var lx=d.data['Type'];
						
						var newqz=new store.model({
							Id:tid,
							name:tname,
							types:lx
						});
						
						store.add(newqz);
					}
					
				}
			});
		}
	},
	
	doInsert:function(g){
	//建立关系
		var dp = this.store.getRange();
		for (var i = 0; i < dp.length; i++) {
			var newDp = new g.dependencyStore.model({
				From: dp[i].data.Id,
				To: uuid,
				Type: dp[i].data.types
			});

			g.dependencyStore.add(newDp);
		}
							
							
	},
	
	doUpdate:function(dt, g){
	//建立关系
		var dp = this.store.getRange();
		//删除关系
		if (g.dependencyStore.getCount() > 0) {
			g.dependencyStore.each(function (d) {
				if (dt.data['To'] == dt.data.Id) {
					g.dependencyStore.remove(d);
				}
			});
		}
		for (var i = 0; i < dp.length; i++) {
			var newDp = new g.dependencyStore.model({
				From: dp[i].data.Id,
				To: dt.data.Id,
				Type: dp[i].data.types
			});

			g.dependencyStore.add(newDp);
		}
							
	},
	
	columns: [
			{
				header: '计划编号',
				dataIndex: 'Id',
				width: 90
			},
			{
				header: '计划名称',
				dataIndex: 'name',
				flex: 1,
				id: 'taskName',
				name: 'taskName',
				editor: {
					blankText: "不能为空，请填写",
					xtype: 'combobox',
					// typeAhead : true,
					queryMode: 'local',
					displayField: 'Name',
					valueField: 'Name',
					// triggerAction : 'all',
					selectOnTab: true,
					store: Ext.create(
							'Ext.data.Store', {
								fields: ['Id',
										'Name']

							}

					),
					listeners: {
						focus: function (combo) {

							combo.store.loadData(getJsonStore(taskStore));

						},
						'select': function (co,
								record, index) {
							var tid = record[0].data.Id;
							this.taskGrid.getSelectionModel().getSelection()[0].set("Id", tid);

						}

					}
				}
			},
			{

				header: '类型',
				dataIndex: 'types',
				width: 90,
				id: 'taskTypes',
				name: 'taskTypes',
				editor: {
					xtype: 'combobox',
					//typeAhead : true,
					//triggerAction : 'all',
					queryMode: 'local',
					displayField: 'Name',
					valueField: 'Id',
					selectOnTab: true,
					store: Ext.create(
							'Ext.data.Store', {
								fields: ['Id',
										'Name'],
								data: [{ 'Id': '0', 'Name': '开始-开始(SS)' },
									  { 'Id': '1', 'Name': '开始-完成(SF' },
									  { 'Id': '2', 'Name': '完成-开始(FS)' },
									  { 'Id': '3', 'Name': '完成-完成(FF)'}]
							}
					)
				}
			},
			{

				header: '延隔时间',
				dataIndex: 'defertimes',
				width: 90,
				renderer: function (value,
						metaData, record, rowIdx,
						colIdx, store, view) {
					return value + ' d';
				},
				editor: {
					xtype: 'numberfield',
					minValue: 0,
					maxValue: 150000
				}
			}],

	width: 600,
	height: 200,
	tbar: [{
		text: '新增',
		handler: function () {
			rowEditing.cancelEdit();

			// Create a model instance
			var r = Ext.create('Employee', {
				tid: '',
				name: '',
				types: '',
				defertimes: 0
			});

			store.insert(0, r);
			rowEditing.startEdit(0, 0);
		}
	}, {
		itemId: 'removeEmployee',
		text: '删除',
		scope: this,
		handler: function () {
			var sm = this.getSelectionModel();
			rowEditing.cancelEdit();
			store.remove(sm.getSelection());
			if (store.getCount() > 0) {
				sm.select(0);
			}
		},
		disabled: true
	}],
	plugins: [rowEditing],
	listeners: {
		'selectionchange': function (view, records) {
			this.down('#removeEmployee').setDisabled(!records.length);
		}
	}

});

						
/*
扩展校验的函数
*/
Ext.apply(
	Ext.form.field.VTypes,
	{
		daterange: function (val, field) {
			var date = field.parseDate(val);

			if (!date) {
				return false;
			}
			if (field.startDateField
					&& (!this.dateRangeMax || (date
							.getTime() != this.dateRangeMax
							.getTime()))) {
				var start = field.up('form').down(
						'#' + field.startDateField);
				start.setMaxValue(date);
				start.validate();
				this.dateRangeMax = date;
			} else if (field.endDateField
					&& (!this.dateRangeMin || (date
							.getTime() != this.dateRangeMin
							.getTime()))) {
				var end = field.up('form').down(
						'#' + field.endDateField);
				end.setMinValue(date);
				end.validate();
				this.dateRangeMin = date;
			}
			/*
			* Always return true since we're only using
			* this vtype to set the min/max allowed
			* values (these are tested for after the
			* vtype test)
			*/
			return true;
		},

		daterangeText: '开始时间必须早于结束时间'

});

Ext.define('TakeTop.TaskAdvancePanel', {
	extend: 'Ext.form.Panel',
	url: 'save-form.jsp',
	bodyStyle: 'padding:0 0 0 0',
	// items : [ {
	anchor: '100%',
	bindMyData: function(dt){
	    this.row = dt;
	    var fis=this.form.getFields().getByKey("firsts");
		fis.setValue(this.row.data.Name);
		var pd=this.form.getFields().getByKey("percentdone");
		pd.setValue(this.row.data.PercentDone);
		var duration=this.form.getFields().getByKey("duration");
		if(this.row.data.Duration==0){
			duration.setValue(1);										
		}else{
			duration.setValue(this.row.data.Duration);
		}
		var sdt=this.form.getFields().getByKey("startdt");
		sdt.setValue(this.row.data.StartDate);
		var ed=this.form.getFields().getByKey("enddt");
		ed.setValue(this.row.data.EndDate);
	},
	
	doMyInsert:function(g){
	    //var u = new Ext.ux.UUID();
		//var uuid = u.createUUID();
		//创建计划
		var newTask = new g.taskStore.model({
			//Id:uuid,
			//uuid: uuid,
			Name: vals.first,
			leaf: true,
			PercentDone: vals.percentdone,
			StartDate: vals.startdt,
			EndDate: vals.enddt,
			BaselineEndDate: vals.enddt,
			BaselineStartDate: vals.startdt
		});
		g.taskStore.getRootNode().appendChild(newTask);
	},
	
	doInsert:function(g){
	    this.doMyInsert(g);
		this.his.taskGrid.doInsert(g);
		this.assignmentgrid.doInsert(g);
	},
	
	doMyUpdate:function(dt, g){
	    var vals = this.form.getFieldValues();
		dt.set('Name', vals.first);
		dt.set('PercentDone', vals.percentdone);
		dt.set('StartDate', vals.startdt);
		dt.set('EndDate', vals.enddt);
	},
	
	doUpdate:function(dt, g){
	    this.doMyUpdate(dt);
		this.taskGrid.doUpdate(dt, g);
		this.assignmentgrid.doUpdate(dt, g);
	},
	
	
	doReset:function(){
	    this.assignmentgrid.store.removeAll();
		this.taskGrid.store.removeAll();
	    this.form.reset();
	},
	
	bindTaskData: function(dt, g){
	    this.bindMyData(dt);
		this.taskGrid.bindTaskData(dt, g);
		this.assignmentgrid.bindTaskData(dt, g);
	},
	
	initComponent : function() {
        Ext.apply(this, {
            items       : this.buildComponents()
        });

        this.callParent(arguments);
    },
	
	buildComponents: function(){
		return [
			{
				layout: 'column',
				border: false,
				defaults: {
					padding: '10px 5px 5px 5px'
				},
				items: [{
					//columnWidth: .5,
					border: false,
					layout: 'anchor',
					defaultType: 'textfield',
					items: [{
						xtype: 'textfield',
						fieldLabel: '计划名称',
						name: 'first',
						id: 'firsts',
						anchor: '96%'
					}]
				}, {
					//columnWidth: .5,
					border: false,
					layout: 'anchor',
					defaultType: 'textfield',
					items: [{
						xtype: 'numberfield',
						fieldLabel: '工期',
						name: 'duration',
						id: 'duration',
						hideLabel: false,
						value: 1,
						minValue: 1,
						allowBlank: false
					}]
				}, {
					// columnWidth:.5,
					border: false,
					layout: 'anchor',
					items: [{
						xtype: 'checkbox',
						name: 'priority',
						id: 'priority',
						boxLabel: '计划',
						hideLabel: false
					}]
				}]
			},
			{
				xtype: 'tabpanel',
				defaults: {
					padding: '0 0 0 0'
				},
				activeItem: 0,
				items: [
						{
							xtype: 'panel',
							title: '常规',
							items: [
									{
										defaults: {
											padding: '10px 5px 5px 5px'
										},
										layout: 'column',
										items: [
												{
													xtype: 'container',
													columnWidth: .5,
													layout: 'anchor',
													items: [{
														xtype: 'numberfield',
														fieldLabel: '完成百分比',
														name: 'percentdone',
														id: 'percentdone',
														hideLabel: false,
														value: 0,
														minValue: 0,
														maxValue: 100,
														allowBlank: false,
														anchor: '96%'
													}]
												},
												{
													xtype: 'container',
													columnWidth: .5,
													layout: 'anchor',
													items: [{
														xtype: 'numberfield',
														fieldLabel: '优先级',
														name: 'priority',
														hideLabel: false,
														value: 500,
														minValue: 1,
														maxValue: 1000,
														allowBlank: false,
														anchor: '100%'
													}]
												}]
									},
									{
										xtype: 'fieldset',
										title: '日期',
										collapsible: true,
										defaultType: 'datefield',
										fieldDefaults: {
											labelWidth: 100,
											msgTarget: 'side',
											autoFitErrors: false
										},
										layout: 'anchor',
										defaults: {
											anchor: '100%'
										},
										margin: '10px 5px 5px 5px',
										items: [
												{
													fieldLabel: '开始时间',
													name: 'startdt',
													id: 'startdt',
													vtype: 'daterange',
													//xtype:'ganttcalendar',
													endDateField: 'enddt'
													//value: starts

												},
												{
													fieldLabel: '结束时间',
													name: 'enddt',
													id: 'enddt',
													vtype: 'daterange',
													startDateField: 'startdt',
													//value:starts,
													listeners: {
														// var
														// dt=Sch.util.Date.getDurationInDays(this.get('startdt'),this.get('enddt'));
														'select': function (
																co,
																record,
																index) {
															var dt = Sch.util.Date
																	.getDurationInBusinessDays(
																			Ext
																					.getCmp(
																							'startdt')
																					.getValue(),
																			Ext
																					.getCmp(
																							'enddt')
																					.getValue());
															if (dt == 0) {
																Ext.getCmp("duration").setValue(1);
															} else {
																Ext.getCmp("duration").setValue(dt);
															}


														}

													}
												}]

									}]
						},
						{
							xtype: 'panel',
							title: '前置计划',
							layout: 'fit',
							scope: this,
							items: this.taskGrid = new TakeTop.TaskGrid()

						},
						{
							xtype: 'panel',
							title: '资源',
							layout: 'fit',
							scope: this,
							items: this.assignmentgrid = new TakeTop.AssignmentGrid()
						},
						{
						    xtype: 'panel',
						    title: '资源管理',
						    layout: 'fit',
						    items: [
                                {
                                    xtype: 'htmleditor',
                                    name: 'bio',
                                    height: 200,
                                    anchor: '100%'
                                }
						    ]
						},
						{
							xtype: 'panel',
							title: '高级',
							items: [{
								xtype: 'fieldset',
								title: '计划限制',
								collapsible: true,
								defaultType: 'datefield',
								fieldDefaults: {
									labelWidth: 100,
									msgTarget: 'side',
									autoFitErrors: false
								},
								layout: 'anchor',
								defaults: {
									anchor: '100%'
								},
								margin: '10px 5px 5px 5px',
								layout: 'column',
								items: [

										{
											xtype: 'container',
											columnWidth: .5,
											layout: 'anchor',
											items: [
													{
														xtype: 'combobox',
														fieldLabel: '限制类型',
														typeAhead: true,
														triggerAction: 'all',
														selectOnTab: true,
														store: [
																[
																		'越早越好',
																		'越早越好'],
																[
																		'越晚越好',
																		'越晚越好'],
																[
																		'必须开始于',
																		'必须开始于'],
																[
																		'必须完成于',
																		'必须完成于'],
																[
																		'不得早于...开始',
																		'不得早于...开始'],
																[
																		'不得晚于...开始',
																		'不得晚于...开始'],
																[
																		'不得早于...完成',
																		'不得早于...完成'],
																[
																		'不得晚于...完成',
																		'不得晚于...完成']],
														lazyRender: true,
														listClass: 'x-combo-list-small'
													},
													{
														xtype: 'combobox',
														fieldLabel: '计划类型',
														typeAhead: true,
														triggerAction: 'all',
														selectOnTab: true,
														store: [
																[
																		'固定单位',
																		'固定单位'],
																[
																		'固定工期',
																		'固定工期'],
																[
																		'固定工时',
																		'固定工时']],
														lazyRender: true,
														listClass: 'x-combo-list-small'
													}]

										},
										{
											xtype: 'container',
											columnWidth: .5,
											layout: 'anchor',
											items: [
													{
														xtype: 'datefield',
														fieldLabel: '限制日期',
														name: 'limit_time'
													},
													{

														xtype: 'checkbox',
														name: 'milestone',
														boxLabel: '标记为里程碑',
														hideLabel: false

													}]
										}]

							}]
						},
						{
							xtype: 'panel',
							title: '备注',
							layout: 'fit',
							items: [{
								xtype: 'htmleditor',
								name: 'bio',
								height: 200,
								anchor: '100%'
							}]
						}]
			}]
		}
	
});

// =========================================================================
Ext.define('TakeTop.TaskDialog', {
	extend: 'Ext.window.Window',
	width: 600,
	//height : 400,
	//hidden: true,
	border: false,
	title: '创建计划',
	maximizable: true,
	closeAction: 'hide',
	layout: 'fit',
	addOrUpdate:0,

	constructor : function(gantt) {
	    //调用父类的构造函数
	    this.callParent(arguments);
	    this.g = gantt;
	},
	
	bindTaskData: function(dt){
	    this.taskAdvancePanel.bindTaskData(dt, this.g);
	},
	
	initComponent : function() {
        Ext.apply(this, {
            items       : this.buildComponents()
        });

        this.callParent(arguments);
    },
	
	buildComponents: function(){
        var me = this;
		return [{

			defaults: {
				padding: '0 0 0 0'
			},
			activeItem: 0,
			items: me.taskAdvancePanel = new TakeTop.TaskAdvancePanel(),
			buttons: [{
				text: '保存',
				handler: function () {
					var vals = me.taskAdvancePanel.form.getFieldValues();
					if (vals.first) {
					    
						//添加计划
						if (me.addOrUpdate == 0) {
							me.taskAdvancePanel.doInsert(me.g);

							
						//修改已经存在的计划
						} else if (me.addOrUpdate == 1) {
							
							var st = me.g.getView().getSelectionModel().getSelection();
							me.taskAdvancePanel.doUpdate(st[0], me.g);
							

						}

						//清空数据
						me.taskAdvancePanel.doReset();
						me.hide();
					} else {
						Ext.Msg.alert('提示', '计划名称不能为空');
					}
				}
			}, {
				text: '取消',
				handler: function () {
				    me.taskAdvancePanel.doReset();
					me.hide();
				}
			}]
		}]
	},
	resizable: {
		dynamic: true
	}
	
});