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
    title: '導入Project文件',
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
                    emptyText: '上傳 .mpp 文件',
                    fieldLabel: '選擇檔',
                    name: 'file',
                    buttonText: '',
                    buttonConfig: {
                        iconCls: 'upload-icon'
                    }
                }],
                buttons: [{
                    text: '上傳',
                    handler: function () {
                        var panel = this.up('form');
                        var form = panel.getForm();
                        if (form.isValid()) {
                            form.submit({
                                url: APIVAR.url.upload + '?pid=' + pid,
                                waitMsg: '正在載入資料...',
                                failure: function (form, action) {
                                    msg('上傳出錯', '請確認上傳檔案格式是否正確. 錯誤位置: ' + action.result.msg);
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
                    text: '重置',
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
                title: '計畫列表',
                collapsible: true
            },

            // Experimental
            schedulerConfig: {
                collapsible: true,
                title: '<table><tr><td>甘特圖</td><td><img src="Images/UpDnArrow.png" width="18" height="24" border="0" alt="排序" onclick="javascript:SortByDate();"></td></tr></table>'

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
                '<tr><td>開始:</td> <td align="right">{[Ext.Date.format(values.StartDate, "y-m-d")]}</td></tr>',
                '<tr><td>結束:</td> <td align="right">{[Ext.Date.format(Ext.Date.add(values.EndDate, Ext.Date.MILLI, -1), "y-m-d")]}</td></tr>',
                '<tr><td>進度:</td><td align="right">{PercentDone}%</td></tr>',
                '<tr><td>負責人:</td><td align="right">{Leader}</td></tr>',
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
                    header: "標記",
                    xtype: 'templatecolumn',
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
                //wbs列有問題
                new Gnt.column.WBS(),
                {
                    xtype: 'treecolumn',
                    header: '計畫名稱',
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
                    header: '開始時間'
                }),

                new Gnt.column.EndDate({
                    //xtype: 'startdatecolumn',
                    header: '結束時間'

                }),
                {
                    xtype: 'durationcolumn',
                    header: '工期',
                },
                {
                    xtype: 'percentdonecolumn',
                    width: 50,
                    header: '完成率'
                },


                //前置計畫， 工期，  部門，負責人，資源
                {

                    width: 60,
                    header: '前置計畫',
                    xtype: 'predecessorcolumn'
                },

                {

                    width: 60,
                    header: '後繼計畫',
                    xtype: 'successorcolumn'
                },

                //{

                //    width: 50,
                //    header: '部門'

                //},
                {
                    width: 60,
                    header: '負責人',
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
                    header: '計劃工時',
                    dataIndex: 'Workhour',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '實際工時',
                    dataIndex: 'Actualhour',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '费用預算',
                    dataIndex: 'Budget',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '實際費用',
                    dataIndex: 'Expense',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '要求數量',
                    dataIndex: 'RequireNumber',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '已完成量',
                    dataIndex: 'FinishedNumber',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '單價',
                    dataIndex: 'Price',
                    editor: { xtype: 'textfield' }
                },

                {
                    width: 60,
                    header: '單位',
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
                                root: "T_JNUnit"
                            }),

                            fields: ['UnitName', 'SortNumber']
                        }),
                        displayField: "UnitName",
                        valueField: "UnitName",
                        editable: false,
                        emptyText: '',
                        value: 1,
                    },
                },


                //{
                //    width: 60,
                //    header: '單位',
                //    dataIndex: 'UnitName',
                //    editor: { xtype: 'textfield' }
                //},

                {
                    header: '優先順序',
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
                //    header: '自訂的列',
                //    renderer: function () {
                //    return '自訂的列';
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
                title: '視圖',
                columns: 3,
                items: [


                    {
                        iconCls: 'icon-prev',
                        text: '後退',
                        scope: this,
                        handler: function () {
                            this.shiftPrevious();
                        }
                    },
                    {
                        iconCls: 'icon-next',
                        text: '前進',
                        scope: this,
                        handler: function () {
                            this.shiftNext();
                        }
                    },
                    {
                        text: '合適螢幕',
                        iconCls: 'zoomfit',
                        handler: function () {
                            this.zoomToFit();

                            ////后退一步
                            //this.shiftPrevious();
                        },
                        scope: this
                    },

                    //{
                    //    text: '全屏',
                    //    iconCls: 'icon-fullscreen',
                    //    disabled: !this._fullScreenFn,
                    //    handler: function () {
                    //        this.showFullScreen();
                    //    },
                    //    scope: this
                    //},

                    {
                        text: '折疊所有',
                        iconCls: 'icon-collapseall',
                        scope: this,
                        handler: function () {
                            this.collapseAll();
                        }
                    },
                    {
                        text: '展開所有',
                        iconCls: 'icon-expandall',
                        scope: this,
                        handler: function () {
                            this.expandAll();
                        }
                    },
                    {
                        text: '初始大小',
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
                title: '縮放',
                columns: 2,
                items: [{
                    text: '6 周',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('weekAndMonth', sp.start, sp.end);
                    }
                },
                {
                    text: '10 周',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('weekAndDayLetter', sp.start, sp.end);
                    }
                },
                {
                    text: '1 年',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();
                        this.switchViewPreset('monthAndYear', sp.start, sp.end);
                    }
                },
                {
                    text: '5 年',
                    scope: this,
                    handler: function () {
                        var sp = this.taskStore.getTotalTimeSpan();

                        this.switchViewPreset('monthAndYear', sp.start, sp.end);
                    }
                }
                ]
            },
            //編輯功能
            {
                xtype: 'buttongroup',
                title: '編輯',
                columns: 5,
                items: [

                    {
                        text: '添加計畫',
                        iconCls: 'icon-add',
                        scope: this,
                        handler: function () {
                            var original = this.getSelectionModel().selected.items[0];
                            var model = this.getTaskStore().model;

                            var newTask = new model({
                                leaf: true
                            });

                            newTask.setPercentDone(0);
                            newTask.setName("新計畫...");
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
                    //    text: '唯讀模式',
                    //    pressed: false,
                    //    handler: function () {
                    //        this.setReadOnly(Ext.getCmp("demo-readonlybutton").pressed);
                    //    }
                    //},

                    {
                        text: '計畫降級',
                        //iconCls : 'indent',
                        scope: this,
                        handler: function () {
                            var sm = this.lockedGrid.getSelectionModel();
                            this.taskStore.indent(sm.getSelection());
                        }
                    },
                    {
                        text: '計畫升級',
                        //iconCls : 'outdent',
                        scope: this,
                        handler: function () {
                            var sm = this.lockedGrid.getSelectionModel();
                            this.taskStore.outdent(sm.getSelection());
                        }
                    },

                    {
                        //iconCls: 'action',
                        text: '標紅拖期計畫',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/UpdateAllTardyPlansToRedColor.aspx?pid=" + pid,
                                success: function (msg) {    //這是處理後執行的函數，msg是處理頁返回的資料

                                    alert("標紅所有拖期計畫完成，如若不成功，說明你沒有此操作許可權！");
                                    location.reload();
                                    //this.refreshViews();

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据

                                    alert("失败，请重新执行一次！");

                                }

                            });

                        }

                    },

                    {
                        //iconCls: 'action',
                        text: '取消標紅',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/DeleteAllTardyPlansToRedColor.aspx?pid=" + pid,
                                success: function (msg) {    //這是處理後執行的函數，msg是處理頁返回的資料
                                    /* alert(msg);*/

                                    alert("取消標紅所有拖期計畫完成，如若不成功，說明你沒有此操作許可權！");
                                    location.reload();
                                    //this.refreshViews();

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据

                                    alert("失败，请重新执行一次！");

                                }

                            });

                        }

                    },

                    //{
                    //    iconCls: 'togglebutton',
                    //    text: '前置計畫影響',
                    //    scope: this,
                    //    enableToggle: true,
                    //    handler: function (btn) {
                    //        this.setCascadeChanges(btn.pressed);
                    //    }
                    //},

                    //{
                    //    //iconCls: 'action',
                    //    text: '一鍵全部轉任務',
                    //    scope: this,

                    //    handler: function (btn) {

                    //        Ext.Ajax.request({

                    //            url: "Handler/ProjectPlanOneStepTransferTask.ashx?pid=" + pid,
                    //            //success: function (msg) {    //這是處理後執行的函數，msg是處理頁返回的資料
                    //            //    alert(msg);
                    //            //}

                    //        });

                    //        alert("全部一鍵轉任務完成，如果不成功，說明有計劃沒有指定負責人或你沒有此操作許可權！");

                    //        this.refreshViews();

                    //    }

                    //},


                    {
                        //iconCls: 'action',
                        text: '同步基準計畫時間',
                        iconCls: 'action',
                        scope: this,

                        handler: function (btn) {

                            Ext.Ajax.request({

                                url: "Handler/SyncProjectBaselinePlanTime.aspx?pid=" + pid,
                                success: function (msg) {    //這是處理後執行的函數，msg是處理頁返回的資料
                                    /*     alert(msg);*/

                                    alert("基準時間同步完成，如若不成功，說明你沒有此操作許可權！");

                                },
                                failure: function (msg) {    //这是处理后执行的函数，msg是处理页返回的数据

                                    alert("失败，请重新执行一次！");

                                }

                            });

                            location.reload();

                        }

                    },

                    {
                        //iconCls: 'action',
                        text: '對比基準',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            this.el.toggleCls('sch-ganttpanel-showbaseline');
                        }
                    },


                    {
                        //iconCls: 'action',
                        text: '打印',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            App.Gantt.gantt.print();

                        }
                    },

                    {
                        text: '保存',
                        //iconCls: 'icon-save',
                        scope: this,
                        handler: function () {
                            this.taskStore.sync({
                                success: function () {

                                    Ext.MessageBox.alert("恭喜", "資料保存成功！");
                                },
                                failure: function () {

                                    Ext.MessageBox.alert("錯誤", "資料保存錯誤");
                                }
                            });

                            this.refreshViews();
                        }
                    }
                ]
            },

            {
                xtype: 'buttongroup',
                title: '標進度',
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
                    //    text: '打印',
                    //    scope: this,
                    //    handler: function () {

                    //        $("#ext-comp-1034-body").printArea();

                    //    }
                    //}

                ]
            },

            {
                xtype: 'buttongroup',
                title: '可擴展功能',
                columns: 2,
                items: [


                    //{
                    //    iconCls: 'action',
                    //    text: '高亮顯示7天以上的計畫',
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
                        text: '滾動到最後一個計畫',
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
                        text: '路徑高亮顯示',
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
                        text: '刷新計畫',
                        enableToggle: true,
                        pressed: false,
                        scope: this,
                        handler: function () {
                            this.refreshViews();
                        }
                    }


                    //{
                    //    iconCls: 'togglebutton',
                    //    text: '過濾: 進度小於30%的計畫',
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
                    //    emptyText: '按關鍵字查找',
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
            //    title: '面板',
            //    columns: 2,
            //    defaults: { scale: "large" },
            //    items: [
            //        {
            //            text: '計畫面板',
            //            scope: this,
            //            handler: function () {
            //                var st = this.getView().getSelectionModel().getSelection();
            //                if (st.length > 0) {

            //                    this.taskEditor.showTask(st[0]);

            //                } else {
            //                    Ext.Msg.alert('提示', '請選擇一個計畫');
            //                }
            //            }
            //        },
            //        {
            //            text: '日曆面板',
            //            scope: this,
            //            handler: function () {
            //                var conf = {
            //                    calendar: this.taskStore.calendar
            //                };

            //                var editorWindow = new Gnt.widget.calendar.CalendarWindow(conf);
            //                editorWindow.show();
            //            }
            //        },


            //        {
            //        	text: '導入Project',
            //        	scope: this,
            //        	handler: function () {
            //        	var g = this;
            //        	var window =  new MSProjectImportPanel({
            //        		listeners : {
            //        		dataavailable: function(form, data) {
            //        		//msg('Success', 'Data from .mpp file loaded ');

            //        		g.taskStore.setRootNode(data.tasks);
            //        		g.resourceStore.loadData(data.resources);
            //        		g.assignmentStore.loadData(data.assignments);
            //        		g.dependencyStore.loadData(data.dependencies);

            //        		var column,
            //        		xtype;

            //        		for (var i=0, l=data.columns.length; i<l; i++){

            //        			xtype = data.columns[i].xtype;
            //        			delete data.columns[i].xtype;

            //        			column = Ext.widget(xtype, data.columns[i]);

            //        			g.lockedGrid.headerCt.add(column);
            //        		}
            //        		g.lockedGrid.headerCt.remove(0);
            //        		g.lockedGrid.getView().refresh();

            //        		g.expandAll();

            //        		var span = g.taskStore.getTotalTimeSpan();
            //        		if (span.start && span.end) {
            //        			g.setTimeSpan(span.start, span.end);
            //        		}
            //        	}
            //        	}
            //        	});
            //        	window.show();
            //        }
            //        }

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
