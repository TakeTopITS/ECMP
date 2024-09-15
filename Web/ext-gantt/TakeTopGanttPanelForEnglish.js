TaskPriority = {
    Low: 0,
    Normal: 1,
    High: 2
};

Ext.define('MSProjectImportPanel', {
    //extend : 'Ext.form.Panel',
    extend: 'Ext.window.Window',
    width: 300,
    frame: true,
    title: 'Import MS Project File',
    bodyPadding: '10 10 0',

    defaults: {
        anchor: '100%',
        allowBlank: false,
        msgTarget: 'side',
        labelWidth: 50
    },
    initComponent: function () {
        this.addEvents('dataavailable');
        var w = this;
        Ext.apply(this, {
            items: [new Ext.form.Panel({
                items: [{
                    xtype: 'filefield',
                    id: 'form-file',
                    emptyText: 'Upload .mpp file',
                    fieldLabel: 'Select File',
                    name: 'file',
                    buttonText: '',
                    buttonConfig: {
                        iconCls: 'upload-icon'
                    }
                }],
                buttons: [{
                    text: 'Upload',
                    handler: function () {
                        var panel = this.up('form');
                        var form = panel.getForm();
                        if (form.isValid()) {
                            form.submit({
                                url: APIVAR.url.upload + '?pid=' + pid,
                                waitMsg: 'Loading data...',
                                failure: function (form, action) {
                                    msg('Upload Error', 'Please confirm whether the uploaded file format is correct: ' + action.result.msg);
                                },
                                success: function (form, action) {
                                    //w.fireEvent('dataavailable', panel, action.result.data);
                                    this.refreshViews();
                                }
                            });
                        }
                    }
                },
                {
                    text: 'Reset',
                    handler: function () {
                        this.up('form').getForm().reset();
                    }
                }]
            })]

        });

        this.callParent(arguments);
    }
});

var msg = function (title, msg) {
    Ext.Msg.show({
        title: title,
        msg: msg,
        minWidth: 200,
        modal: true,
        icon: Ext.Msg.INFO,
        buttons: Ext.Msg.OK
    });
};



Ext.define("MyApp.DemoGanttPanel", {
    extend: "Gnt.panel.Gantt",
    requires: [
        'Gnt.plugin.TaskContextMenu',
        'Gnt.column.StartDate',
        'Gnt.column.EndDate',
        'Gnt.column.Duration',
        'Gnt.column.PercentDone',
        'Gnt.column.ResourceAssignment',
        'Sch.plugin.TreeCellEditing',
        'Sch.plugin.Pan'
    ],
    rightLabelField: 'Responsible',
    highlightWeekends: true,
    showTodayLine: true,
    loadMask: true,
    enableProgressBarResize: true,


    initComponent: function () {

        Ext.apply(this, {
            enableBaseline: true,
            baselineVisible: false,
            lockedGridConfig: {
                width: 300,
                title: 'Plan List',
                collapsible: true
            },

            // Experimental
            schedulerConfig: {
                collapsible: true,

                title: '<table><tr><td>Gantt Chart</td><td><img src="Images/UpDnArrow.png" width="18" height="24" border="0" alt="排序" onclick="javascript:SortByDate();"></td></tr></table>'
            },

            leftLabelField: {
                dataIndex: 'Name',
                editor: { xtype: 'textfield' }
            },
            rightLabelField: {
                dataIndex: 'AssignmentResources'
            },



            // Define an HTML template for the tooltip
            tooltipTpl: new Ext.XTemplate(
                '<h4 class="tipHeader">{Name}</h4>',
                '<table class="taskTip">',
                '<tr><td>Start:</td> <td align="right">{[Ext.Date.format(values.StartDate, "y-m-d")]}</td></tr>',
                '<tr><td>End:</td> <td align="right">{[Ext.Date.format(Ext.Date.add(values.EndDate, Ext.Date.MILLI, -1), "y-m-d")]}</td></tr>',
                '<tr><td>PercentDone:</td><td align="right">{PercentDone}%</td></tr>',
                '<tr><td>Leader:</td><td align="right">{Leader}</td></tr>',
                '</table>'
            ).compile(),

            eventRenderer: function (task) {
                return {
                    style: 'background-color: #' + task.data.TaskColor
                };
            },

            // Define the static columns
            columns: [
                //column displaying task color
                {
                    header: 'Color',
                    xtype: 'templatecolumn',
                    header: "Mark",
                    width: 50,
                    tdCls: 'sch-column-color',
                    //locked: true,
                    field: {
                        allowBlank: false
                    },
                    tpl: '<div class="color-column-inner" style="background-color:#{TaskColor}">&nbsp;</div>',
                    listeners: {
                        click: function (panel, el, a, b, event, record) {
                            event.stopEvent();
                            this.rec = record;
                            this.showColumnMenu(el, event, record);
                        }
                    },
                    showColumnMenu: function (el, event, rec) {
                        //if color menu is not present, create a new Ext.menu.Menu instance
                        if (!this.colorMenu) {
                            this.colorMenu = new Ext.menu.Menu({
                                cls: 'gnt-locked-colormenu',
                                plain: true,
                                items: [
                                    Ext.create('Ext.ColorPalette', {
                                        allowReselect: true,
                                        listeners: {
                                            select: function (cp, color) {
                                                this.tpl.apply({ TaskColor: color });
                                                this.rec.set('TaskColor', color);
                                                this.colorMenu.hide();
                                            },
                                            scope: this
                                        }
                                    })
                                ]
                            });
                        }

                        this.colorMenu.showAt(event.xy);
                    }
                },
                //wbs列有问题
                new Gnt.column.WBS(),

                {
                    xtype: 'treecolumn',
                    header: 'Plan Name',
                    sortable: true,
                    dataIndex: 'Name',
                    width: 250,
                    //locked: true,
                    field: {
                        allowBlank: false
                    },
                    renderer: function (v, meta, r) {
                        if (!r.data.leaf) meta.tdCls = 'sch-gantt-parent-cell';

                        return v;
                    }
                },

                new Gnt.column.StartDate({
                    //xtype: 'startdatecolumn',
                    header: 'Start Date'
                }),

                new Gnt.column.EndDate({
                    //xtype: 'startdatecolumn',
                    header: 'End Date'

                }),
                {
                    xtype: 'durationcolumn',
                    header: 'Duration',
                },
                {
                    xtype: 'percentdonecolumn',
                    width: 60,
                    header: 'Percentdone'
                },


                //前置计划， 工期，  部门，负责人，资源
                {

                    width: 60,
                    header: 'Predecessor Plan',
                    xtype: 'predecessorcolumn'
                },

                {

                    width: 60,
                    header: 'Successor Plan',
                    xtype: 'successorcolumn'
                },

                //{

                //    width: 50,
                //    header: '部门'

                //},
                {
                    width: 60,
                    header: 'Leader',
                    dataIndex: 'Leader',
                    editor: {
                        xtype: 'combobox',
                        name: "cmb_Leader",
                        store: ankData = new Ext.data.JsonStore({
                            root: 'list',
                            proxy: new Ext.data.HttpProxy({
                                url: 'handler/ProjectRelatedUserController.aspx?action=read&pid=' + pid.toString().substr(0, pid.toString().length - 2)
                            }),
                            autoLoad: true,
                            reader: new Ext.data.JsonReader({
                                root: "t_relateduser"
                            }),

                            fields: ['usercode', 'username']
                        }),
                        displayField: "username",
                        valueField: "usercode",
                        editable: false,
                        emptyText: '',
                        value: 1,
                    },
                },

                {
                    width: 60,
                    header: 'Workhour',
                    dataIndex: 'Workhour',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'Actual Workhour',
                    dataIndex: 'Actualhour',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'Budget',
                    dataIndex: 'Budget',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'Expense',
                    dataIndex: 'Expense',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'RequireNumber',
                    dataIndex: 'RequireNumber',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'FinishedNumber',
                    dataIndex: 'FinishedNumber',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'Price',
                    dataIndex: 'Price',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: 'UnitName',
                    dataIndex: 'UnitName',
                    editor: {
                        xtype: 'combobox',
                        name: "cmb_UnitName",
                        store: ankData = new Ext.data.JsonStore({
                            root: 'list',
                            proxy: new Ext.data.HttpProxy({
                                url: 'handler/ProjectRelatedUnitController.aspx?action=read'
                            }),
                            autoLoad: true,
                            reader: new Ext.data.JsonReader({
                                root: "t_jnunit"
                            }),

                            fields: ['unitname', 'sortnumber']
                        }),
                        displayField: "unitname",
                        valueField: "unitname",
                        editable: false,
                        emptyText: '',
                        value: 1,
                    },
                },


                //{
                //    width: 60,
                //    header: 'UnitName',
                //    dataIndex: 'UnitName',
                //    editor: { xtype: 'textfield' }
                //},



                {
                    header: 'Priority',
                    width: 60,
                    editor: {
                        xtype: 'combobox',
                        name: "cmb_Priority",
                        store: Ext.create("Ext.data.Store", {
                            fields: ["Id", "Name"],
                            data: [{
                                Id: TaskPriority.Low,
                                Name: 'Low'
                            },
                            { Id: TaskPriority.Normal, Name: 'Normal' },
                            { Id: TaskPriority.High, Name: 'High' }]
                        }),
                        displayField: "Name",
                        valueField: "Id",
                        editable: false,
                        emptyText: 'Normal',
                        value: 1,
                    },
                    dataIndex: 'Priority',
                    renderer: function (v, m, r) {
                        switch (v) {
                            case TaskPriority.Low:
                                return 'Low';

                            case TaskPriority.Normal:
                                return 'Normal';

                            case TaskPriority.High:
                                return 'High';
                        }
                    }
                },

                //{
                //    xtype: 'booleancolumn',
                //    width: 50,

                //    header: '人工',

                //    dataIndex: 'ManuallyScheduled',

                //    field: {
                //    xtype: 'combo',
                //    store: ['true', 'false']
                //}
                //},

                //{
                //    //xtype : 'text',
                //    width: 50,
                //    header: '自定义的列',
                //    renderer: function () {
                //    return '自定义的列';
                //}
                //}


            ],

            // Define the buttons that are available for user interaction
            tbar: this.createToolbar()

        });


        this.callParent(arguments);
    },


    createToolbar: function () {
        return [

            {
                xtype: 'buttongroup',
                title: '',
                columns: 1,
                items: [

                    {
                        //iconCls: '<img src="Images/LeftRightArrow.png" width="18" height="24" border="0" alt="隐藏右边栏">',
                        text: '<img src="Images/LeftRightArrow.png" width="18" height="24" border="0" alt="隐藏右边栏">',
                        scope: this,
                        handler: function () {
                            ChangeMenu(1);
                        }
                    }

                    //{
                    //    //iconCls: '<img src="Images/LeftRightArrow.png" width="18" height="24" border="0" alt="隐藏右边栏">',
                    //    text: '<img src="Images/UpDnArrow.png" width="18" height="24" border="0" alt="隐藏右边栏">',
                    //    scope: this,
                    //    handler: function () {
                    //        $(".x-column-header-trigger").eq(3).click();
                    //    }
                    //}


                ]
            },

            {
                xtype: 'buttongroup',
                title: 'View',
                columns: 3,
                items: [


                    {
                        iconCls: 'icon-prev',
                        text: 'Back',
                        scope: this,
                        handler: function () {
                            this.shiftPrevious();
                        }
                    },
                    {
                        iconCls: 'icon-next',
                        text: 'Next',
                        scope: this,
                        handler: function () {
                            this.shiftNext();
                        }
                    },
                    {
                        text: 'Zoom Fit',
                        iconCls: 'zoomfit',
                        handler: function () {
                            this.zoomToFit();

                            ////后退一步
                            //this.shiftPrevious();
                        },
                        scope: this
                    },

                    //{
                    //    text: 'Full Screen',
                    //    iconCls: 'icon-fullscreen',
                    //    disabled: !this._fullScreenFn,
                    //    handler: function () {
                    //        this.showFullScreen();
                    //    },
                    //    scope: this
                    //},

                    {
                        text: 'Collapse All',
                        iconCls: 'icon-collapseall',
                        scope: this,
                        handler: function () {
                            this.collapseAll();
                        }
                    },
                    {
                        text: 'Expand All',
                        iconCls: 'icon-expandall',
                        scope: this,
                        handler: function () {
                            this.expandAll();
                        }
                    },
                    {
                        text: 'Initial Size',
                        iconCls: 'zoomfit',
                        handler: function () {
                            var sp = this.taskStore.getTotalTimeSpan();
                            this.switchViewPreset('weekAndDayLetter', sp.start, sp.end);

                            ////后退一步
                            //this.shiftPrevious();
                        },
                        scope: this
                    }
                ]
            },
            {
                xtype: 'buttongroup',
                title: 'Zoom',
                columns: 2,
                items: [{
                    text: '6 Week',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('weekAndMonth', sp.start, sp.end);
                    }
                },
                {
                    text: '10 Week',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('weekAndDayLetter', sp.start, sp.end);
                    }
                },
                {
                    text: '1 year',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('monthAndYear', sp.start, sp.end);
                    }
                },
                {
                    text: '5 year',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();

                        this.switchViewPreset('monthAndYear', sp.start, sp.end);
                    }
                }
                ]
            },
            //编辑功能
            {
                xtype: 'buttongroup',
                title: 'Edit',
                columns: 5,
                items: [

                    {
                        text: 'Add New',
                        iconCls: 'icon-add',
                        scope: this,
                        handler: function () {
                            var original = this.getSelectionModel().selected.items[0];
                            var model = this.getTaskStore().model;

                            var newTask = new model({
                                leaf: true
                            });

                            newTask.setPercentDone(0);
                            newTask.setName("New plan...");
                            //newTask.setStartDate((original && original.getStartDate()) || null);
                            ///newTask.setEndDate((original && original.getEndDate()) || null);
                            // newTask.setDuration((original && original.getDuration()) || null);
                            //newTask.setDurationUnit((original && original.getDurationUnit()) || 'd');

                            newTask.set(newTask.startDateField, (original && original.getStartDate()) || null);
                            newTask.set(newTask.endDateField, (original && original.getEndDate()) || null);
                            newTask.set(newTask.durationField, (original && original.getDuration()) || null);
                            newTask.set(newTask.durationUnitField, (original && original.getDurationUnit()) || 'd');

                            if (original) {
                                original.addTaskBelow(newTask);
                            } else {
                                this.taskStore.getRootNode().appendChild(newTask);
                            }
                        }

                    },
                    //{
                    //    enableToggle: true,
                    //    id: 'demo-readonlybutton',
                    //    scope: this,
                    //    text: '只读模式',
                    //    pressed: false,
                    //    handler: function () {
                    //        this.setReadOnly(Ext.getCmp("demo-readonlybutton").pressed);
                    //    }
                    //},

                    {
                        text: 'Plan Indent',
                        //iconCls : 'indent',
                        scope: this,
                        handler: function () {
                            var sm = this.lockedGrid.getSelectionModel();
                            this.taskStore.indent(sm.getSelection());
                        }
                    },
                    {
                        text: 'Plan Ourtdent',
                        //iconCls : 'outdent',
                        scope: this,
                        handler: function () {
                            var sm = this.lockedGrid.getSelectionModel();
                            this.taskStore.outdent(sm.getSelection());
                        }
                    },

                    {
                        //iconCls: 'action',
                        text: 'Red-off plan',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/UpdateAllTardyPlansToRedColor.aspx?pid=" + pid,
                                success: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据

                                    alert("The red mark all the delay plan is completed, if unsuccessful, indicate that you do not have this operation authority！");
                                    location.reload();
                                    //this.refreshViews();

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                                    /*   alert(msg);*/

                                    alert("fail,please do again！");
                                }

                            });

                        }

                    },

                    {
                        //iconCls: 'action',
                        text: 'CancelRedPlan',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/DeleteAllTardyPlansToRedColor.aspx?pid=" + pid,
                                success: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                                    /*  alert(msg);*/

                                    alert("Cancel all towing schedule for red label. If unsuccessful, you are not authorized to do so！");
                                    location.reload();
                                    //this.refreshViews();

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                                    /*   alert(msg);*/

                                    alert("fail,please do again！");
                                }

                            });

                        }

                    },

                    //{
                    //    iconCls: 'togglebutton',
                    //    text: 'Impact of preplan',
                    //    scope: this,
                    //    enableToggle: true,
                    //    handler: function (btn) {
                    //        this.setCascadeChanges(btn.pressed);
                    //    }
                    //},

                    //{
                    //    //iconCls: 'action',
                    //    text: 'TransferredAllToTasks',
                    //    scope: this,

                    //    handler: function (btn) {

                    //        Ext.Ajax.request({

                    //            url: "Handler/ProjectPlanOneStepTransferTask.ashx?pid=" + pid,
                    //            //success: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                    //            //    alert(msg);
                    //            //}

                    //        });

                    //        alert("Complete one-click task completion, if unsuccessful, indicates that the plan has no designated person or you have no access to this operation！");

                    //        this.refreshViews();

                    //    }

                    //},


                    {
                        //iconCls: 'action',
                        text: 'SyncBaselinePlanTime',
                        iconCls: 'action',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/SyncProjectBaselinePlanTime.aspx?pid=" + pid,
                                success: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                                    /*   alert(msg);*/

                                    alert("The baseline time is completed synchronously. If unsuccessful, you have no access to this operation！");

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据
                                    /*   alert(msg);*/

                                    alert("fail,please do again！");

                                }

                            });

                            location.reload();

                        }

                    },

                    {
                        //iconCls: 'action',
                        text: 'ComparedBaseline',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            this.el.toggleCls('sch-ganttpanel-showbaseline');
                        }
                    },


                    {
                        //iconCls: 'action',
                        text: 'Print',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            App.Gantt.gantt.print();

                        }
                    },

                    {
                        text: 'Save',
                        //iconCls: 'icon-save',
                        scope: this,
                        handler: function () {
                            this.taskStore.sync({
                                success: function () {

                                    Ext.MessageBox.alert("Sucessful", "Save sucessful！");
                                },
                                failure: function () {

                                    Ext.MessageBox.alert("Error", "Save failed");
                                }
                            });

                            this.refreshViews();
                        }
                    }
                ]
            },

            {
                xtype: 'buttongroup',
                title: 'Apply PercentDone',
                columns: 3,
                //defaults: { scale: "large" },
                items: [{
                    text: '0%',
                    scope: this,
                    handler: function () {
                        this.applyPercentDone(0);
                    }
                },
                {
                    text: '25%',
                    scope: this,
                    handler: function () {
                        this.applyPercentDone(25);
                    }
                },
                {
                    text: '50%',
                    scope: this,
                    handler: function () {
                        this.applyPercentDone(50);
                    }
                },
                {
                    text: '75%',
                    scope: this,
                    handler: function () {
                        this.applyPercentDone(75);
                    }
                },
                {
                    text: '100%',
                    scope: this,
                    handler: function () {
                        this.applyPercentDone(100);
                    }
                }

                    //{
                    //    text: 'Print',
                    //    scope: this,
                    //    handler: function () {

                    //        $("#ext-comp-1034-body").printArea();
                    //    }
                    //}

                ]
            },

            {
                xtype: 'buttongroup',
                title: 'Expandable Function',
                columns: 2,
                items: [

                    //{
                    //    iconCls: 'action',
                    //    text: 'Highlight plans for more than seven days',
                    //    scope: this,
                    //    handler: function (btn) {
                    //        this.taskStore.getRootNode().cascadeBy(function (task) {
                    //            if (Sch.util.Date.getDurationInDays(task.get('StartDate'), task.get('EndDate')) > 7) {
                    //                var el = this.getSchedulingView().getElementFromEventRecord(task);
                    //                el && el.frame('lime');
                    //            }
                    //        }, this);
                    //    }
                    //},

                    {
                        iconCls: 'action',
                        text: 'Scroll to the last plan',
                        scope: this,
                        handler: function (btn) {
                            var latestEndDate = new Date(0),
                                latest;
                            this.taskStore.getRootNode().cascadeBy(function (task) {
                                if (task.get('EndDate') >= latestEndDate) {
                                    latestEndDate = task.get('EndDate');
                                    latest = task;
                                }
                            });
                            this.getSchedulingView().scrollEventIntoView(latest, true);
                        }
                    },

                    {
                        text: 'path highlighted',
                        iconCls: 'togglebutton',
                        scope: this,
                        enableToggle: true,
                        handler: function (btn) {
                            var v = this.getSchedulingView();
                            if (btn.pressed) {
                                v.highlightCriticalPaths(true);
                            } else {
                                v.unhighlightCriticalPaths(true);
                            }
                        }
                    },

                    {
                        iconCls: 'action',
                        text: 'Refresh Plan',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            this.refreshViews();
                        }
                    }


                    //{
                    //    iconCls: 'togglebutton',
                    //    text: '过滤: 进度小于30%的计划',
                    //    scope: this,
                    //    enableToggle: true,
                    //    toggleGroup: 'filter',
                    //    handler: function (btn) {
                    //        if (btn.pressed) {
                    //            this.taskStore.filter(function (task) {
                    //                return task.get('PercentDone') < 30;
                    //            });
                    //        } else {
                    //            this.taskStore.clearFilter();
                    //        }
                    //    }
                    //},


                    //{
                    //    xtype: 'textfield',
                    //    emptyText: '按关键字查找',
                    //    scope: this,
                    //    width: 150,
                    //    enableKeyEvents: true,
                    //    listeners: {
                    //        keyup: {
                    //            fn: function (field, e) {
                    //                var value = field.getValue();

                    //                if (value) {
                    //                    this.taskStore.filter('Name', field.getValue(), true, false);
                    //                } else {
                    //                    this.taskStore.clearFilter();
                    //                }
                    //            },
                    //            scope: this
                    //        },
                    //        specialkey: {
                    //            fn: function (field, e) {
                    //                if (e.getKey() === e.ESC) {
                    //                    field.reset();
                    //                }
                    //                this.taskStore.clearFilter();
                    //            },
                    //            scope: this
                    //        }
                    //    }
                    //},
                ]
            },
            //{
            //    xtype: 'buttongroup',
            //    title: 'Panel',
            //    columns: 2,
            //    defaults: { scale: "large" },
            //    items: [
            //        {
            //            text: 'Plan Panel',
            //            scope: this,
            //            handler: function () {
            //                var st = this.getView().getSelectionModel().getSelection();
            //                if (st.length > 0) {

            //                    this.taskEditor.showTask(st[0]);

            //                } else {
            //                    Ext.Msg.alert('Wanring', 'Please select plan');
            //                }
            //            }
            //        },
            //{
            //    text: '日历面板',
            //    scope: this,
            //    handler: function () {
            //        var conf = {
            //            calendar: this.taskStore.calendar
            //        };

            //        var editorWindow = new Gnt.widget.calendar.CalendarWindow(conf);
            //        editorWindow.show();
            //    }
            //},


            //{
            //	text: '导入Project',
            //	scope: this,
            //	handler: function () {
            //	var g = this;
            //	var window =  new MSProjectImportPanel({
            //		listeners : {
            //		dataavailable: function(form, data) {
            //		//msg('Success', 'Data from .mpp file loaded ');

            //		g.taskStore.setRootNode(data.tasks);
            //		g.resourceStore.loadData(data.resources);
            //		g.assignmentStore.loadData(data.assignments);
            //		g.dependencyStore.loadData(data.dependencies);

            //		var column,
            //		xtype;

            //		for (var i=0, l=data.columns.length; i<l; i++){

            //			xtype = data.columns[i].xtype;
            //			delete data.columns[i].xtype;

            //			column = Ext.widget(xtype, data.columns[i]);

            //			g.lockedGrid.headerCt.add(column);
            //		}
            //		g.lockedGrid.headerCt.remove(0);
            //		g.lockedGrid.getView().refresh();

            //		g.expandAll();

            //		var span = g.taskStore.getTotalTimeSpan();
            //		if (span.start && span.end) {
            //			g.setTimeSpan(span.start, span.end);
            //		}
            //	}
            //	}
            //	});
            //	window.show();
            //}
            //}

            //    ]
            //},

        ];
    },

    applyPercentDone: function (value) {
        this.getSelectionModel().selected.each(function (task) { task.setPercentDone(value); });
    },

    showFullScreen: function () {
        this.el.down('.x-panel-body').dom[this._fullScreenFn]();
    },

    // Experimental, not X-browser
    _fullScreenFn: (function () {
        var docElm = document.documentElement;

        if (docElm.requestFullscreen) {
            return "requestFullscreen";
        }
        else if (docElm.mozRequestFullScreen) {
            return "mozRequestFullScreen";
        }
        else if (docElm.webkitRequestFullScreen) {
            return "webkitRequestFullScreen";
        }
    })()
});