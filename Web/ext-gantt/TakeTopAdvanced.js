/*

* 该文件定义了TaskStore类， Dependency类，产生了Gantt的实例
*  DemoGanttPanel中一个复杂甘特图的类， 该文件只是将他实例化
*/

Ext.ns('App');
Ext.BLANK_IMAGE_URL = "ext-min/resources/themes/Images/default/tree/s.gif";


//Ext.require([
//    'MyApp.DemoGanttPanel'
//]);

/*
 * 汉化 界面，
 * 汉化 面板，
 * 小图标
 * 导入导出
 * 之前的grid
 * dirty图标
 * 
 * */

Ext.ns("TakeTop");

Ext.define('TakeTop.TaskContextMenu', {
    extend: 'Gnt.plugin.TaskContextMenu',
    triggerEvent: 'itemcontextmenu',

    createMenuItems: function () {
        return this.callParent().concat(

            {
                text: '编辑',
                requiresTask: true,
                handler: this.editTask,
                scope: this
            },

            {
                text: '------',

            },

            {
                text: '显示到当前计划',
                requiresTask: true,
                handler: this.onMyHandler,
                scope: this
            }

        )
    },

    onMyHandler: function () {
        // the task on which the right click have occured
        var task = this.rec;
        // this.grid.taskStore.remove(selected.getRange());
        //滚动到某个计划
        this.grid.getSchedulingView().scrollEventIntoView(task, true);
    },

    editTask: function () {

        this.grid.taskEditor.showTask(this.rec);
      
    }
});

Ext.onReady(function () {
    Ext.QuickTips.init();
    //Localize();

    App.Gantt.init();
});


App.Gantt = {

    // Initialize application
    init: function (serverCfg) {
        this.gantt = this.createGantt();

        var vp = Ext.create("Ext.Viewport", {
            layout: 'border',
            items: [
                /*{
                region      : 'north',
                contentEl   : 'north',
                bodyStyle   : 'padding:15px'
                },*/
                this.gantt
            ]
        });
    },

    createGantt: function () {

        Ext.define('MyTaskModel', {
            extend: 'Gnt.model.Task',

            //todo:尚未实现
            isMilestone: function () {
                return this.get('Milestone');
            },
            //这里使用mapping比使用XXXField也许要好

            fields: [
                { name: 'Id', mapping: "id", type: 'int', useNull: true },
                { name: 'PercentDone', mapping: 'percent_done', type: 'int' },
                { name: "Name", mapping: 'name' },
                { name: "Priority", mapping: 'priority', type: 'int' },

                { name: "BaselineStartDate", mapping: 'baseline_start_date', type: 'date', dateFormat: 'c', persist: true },
                { name: "BaselineEndDate", mapping: 'baseline_end_date', type: 'date', dateFormat: 'c', persist: true },
                { name: 'BaselinePercentDone', mapping: 'baseline_percent_done', type: 'int' },

                //这个在计划升级降级中有非常重要的作用
                //parentId的p注意是小写
                { name: 'parentId', mapping: 'parent_id', type: 'int' },
                { name: 'Duration', mapping: 'duration', type: 'float' },
                { name: 'DurationUnit', mapping: 'duration_unit', persist: true },

                { name: 'other_field', persist: true },

                { name: 'pid', type: 'int', persist: true },
                { name: 'index', type: 'int', persist: true },

                { name: 'StartDate', mapping: 'start_date', type: 'date', dateFormat: 'c', persist: true },
                { name: 'EndDate', mapping: 'end_date', type: 'date', dateFormat: 'c', persist: true },

                { name: 'LeaderCode', mapping: 'leadercode' },
                { name: 'Leader', mapping: 'leader' },

                { name: 'Workhour', mapping: 'workhour', type: 'float' },
                { name: 'Actualhour', mapping: 'actualhour', type: 'float' },

                { name: 'Budget', mapping: 'budget', type: 'float' },
                { name: 'Expense', mapping: 'expense', type: 'float' },

                { name: 'AssignmentResources', mapping: 'assignmentresources' },
                { name: 'Note', mapping: 'remark' },
                { name: 'TaskColor', mapping: 'taskcolor' },

                { name: 'RequireNumber', mapping: 'requirenumber', type: 'float' },
                { name: 'FinishedNumber', mapping: 'finishednumber', type: 'float' },
                { name: 'Price', mapping: 'price', type: 'float' },
                { name: 'UnitName', mapping: 'unitname' }

            ]
        });


        var taskStore = Ext.create("Gnt.data.TaskStore", {
            model: 'MyTaskModel',
            //sorters : 'StartDate',
            autoLoad: true,
            autoSync: true, //自动保存
            proxy: {
                type: 'ajax',
                headers: { "Content-Type": 'application/json' },
                api: APIVAR.task,
                extraParams: { pid: pid },
                writer: {
                    type: 'json',
                    encode: false,
                    //让post back的数据按照mapping的值回写
                    nameProperty: 'mapping',
                    allowSingle: false
                },
                reader: {
                    type: 'json'
                }
            }
        });

        Ext.define('MyDependencyModel', {
            extend: 'Gnt.model.Dependency',

            //这里使用mapping比使用XXXField也许要好

            fields: [
                { name: 'Id', mapping: "id", type: 'int', useNull: true },
                { name: 'From', mapping: 'from_id', type: 'int' },
                { name: 'To', mapping: 'to_id', type: 'int' },
                { name: "Type", mapping: 'type', type: 'int' },
                { name: 'pid', type: 'int' }
            ]
        });

        //计划和计划之间的关系
        var dependencyStore = Ext.create("Gnt.data.DependencyStore", {
            model: 'MyDependencyModel',
            autoLoad: true,
            autoSync: true, //自动保存
            proxy: {
                type: 'ajax',
                headers: { "Content-Type": 'application/json' },
                method: 'GET',
                reader: {
                    type: 'json'
                },
                writer: {
                    type: 'json',
                    encode: false,
                    //让post back的数据按照mapping的值回写
                    nameProperty: 'mapping',
                    allowSingle: false
                },
                extraParams: { pid: pid },
                api: APIVAR.dependency
            }
        });

        Ext.define('MyResourceModel', {
            extend: 'Gnt.model.Resource',


            fields: [
                { name: 'Id', mapping: "id", type: 'int', useNull: true },
                { name: 'Name', mapping: 'name' }
            ]
        });
        //资源仓库
        var resourceStore = Ext.create("Gnt.data.ResourceStore", {
            model: 'MyResourceModel',
            autoLoad: true,
            autoSync: true,
            proxy: {
                type: 'ajax',
                headers: { "Content-Type": 'application/json' },
                method: 'GET',
                reader: {
                    type: 'json'
                },
                writer: {
                    type: 'json',
                    encode: false,
                    //让post back的数据按照mapping的值回写
                    nameProperty: 'mapping',
                    allowSingle: false
                },
                //extraParams: { id: Id },
                api: APIVAR.resources
            }
        });
        //var resourceStore = Ext.create("Gnt.data.ResourceStore", {
        //    autoLoad: true,
        //    proxy: {
        //        type: 'memory'
        //    }
        //});

        //计划与资源关联 assignment
        Ext.define('MyAssignmentModel', {
            extend: 'Gnt.model.Assignment',


            fields: [
                { name: 'Id', mapping: "id", type: 'int', useNull: true },
                { name: 'TaskId', mapping: "task_id", type: 'int' },
                { name: 'ResourceId', mapping: "resource_id", type: 'int' },
                { name: 'Units', mapping: "units_val", type: 'int' },
                { name: 'ResourceId', mapping: "resourceId", type: 'int' },
                { name: 'UnitsVal', mapping: "unitsVal", type: 'int' }
            ]
        });
        var assignmentStore = Ext.create("Gnt.data.AssignmentStore", {
            model: 'MyAssignmentModel',
            autoLoad: true,
            autoSync: true,
            proxy: {
                type: 'ajax',
                headers: { "Content-Type": 'application/json' },
                method: 'GET',
                reader: {
                    type: 'json'
                },
                writer: {
                    type: 'json',
                    encode: false,
                    //让post back的数据按照mapping的值回写
                    nameProperty: 'mapping',
                    allowSingle: false
                },

                api: APIVAR.assignment

            }
        });

        //var assignmentStore = Ext.create("Gnt.data.AssignmentStore", {
        //    autoLoad: true,
        //    resourceStore: resourceStore,
        //    proxy: {
        //        type: 'memory'
        //    }
        //});

        var start = new Date(2012, 0, 1);
        var g = Ext.create("MyApp.DemoGanttPanel", {
            region: 'center',
            selModel: new Ext.selection.TreeModel({ ignoreRightMouseSelection: false, mode: 'MULTI' }),
            taskStore: taskStore,
            dependencyStore: dependencyStore,

            resourceStore: resourceStore,
            assignmentStore: assignmentStore,
            //snapToIncrement : true,    // Uncomment this line to get snapping behavior for resizing/dragging.
            columnLines: true,


            startDate: g_start,
            endDate: g_end,


            viewPreset: 'weekAndDayLetter',

            // Add some extra functionality
            plugins: [
				Ext.create("Gnt.plugin.Printable"),
                Ext.create("TakeTop.TaskContextMenu"),
                { ptype: 'bufferedrenderer' },
                //Ext.create("Sch.plugin.Pan"),
                Ext.create('Sch.plugin.TreeCellEditing', { clicksToEdit: 2 }),
                this.taskEditor = Ext.create('Gnt.plugin.TaskEditor')
            ]


        });

        g.on({
            /*dependencydblclick : function(ga, rec) {
            var from    = taskStore.getNodeById(rec.get('From')).get('Name'),
            to      = taskStore.getNodeById(rec.get('To')).get('Name');
                    
            Ext.Msg.alert('Hey', Ext.String.format('You clicked the link between "{0}" and "{1}"', from, to));
            },*/
            timeheaderdblclick: function (col, start, end) {
                Ext.Msg.alert('Hey', 'You click header cell : ' + Ext.Date.format(start, 'Y-m-d') + ' - ' + Ext.Date.format(end, 'Y-m-d'));
            },
            scope: this
        });

        return g;
    }
};

