Ext.ns('App');

//Ext.Loader.setConfig({enabled: true, disableCaching : true });
//Ext.Loader.setPath('Sch', '../../../ExtScheduler2.x/js/Sch');
//Ext.Loader.setPath('Gnt', '../../js/Gnt');

Ext.require([
    'Gnt.panel.Gantt',
    'Gnt.column.PercentDone',
    'Gnt.column.StartDate',
    'Gnt.column.EndDate',
    'Gnt.plugin.TaskContextMenu'
]);

Ext.onReady(function() { 
    App.Gantt.init(); 
});

App.Gantt = {
    
    generateTaskData : function() {
        var arr = [],
            i, j, k,
            cn, cn2,
            dt = new Date(2010, 0, 5);

        for (var i = 1; i < 10*g_rows; i++) {
            cn = [];
            for (j = 1; j < 10; j++) {
                cn2 = [];
                for (k = 1; k < 10; k++) {
                    cn2.push({
                        Id : 100*i+10*j+k,
                        Name : 'Child task ' + String(i)+String(j)+String(k),
                        StartDate : dt,
                        Duration : 2,
                        leaf : true
                    });
                }
                cn.push({
                    Id : 100*i+10*j,
                    Name : 'Child task ' + String(i)+String(j),
                    StartDate : dt,
                    Duration : 2,
                    expanded : true,
                    children : cn2
                });
                dt = Ext.Date.add(dt, Ext.Date.DAY, 7)
            }
            arr.push({  
                Id : 100*i,
                Name : 'Root task #' + i,
                StartDate : new Date(2010, 0, 5),
                EndDate : dt,
                children : cn,
                expanded : true
            });
        }

        return arr;
    },

    // Initialize application
    init: function (serverCfg) {
        Ext.QuickTips.init();

        var taskStore = Ext.create("Gnt.data.TaskStore", {
            // sorting slow downs the initial loading/rendering time for big trees
            sortOnLoad  : false,
            
            proxy       : {
                type    : 'memory',
                
                data    : this.generateTaskData()
            }
        });
        
        var dependencyStore = Ext.create("Gnt.data.DependencyStore", {
            proxy : 'memory',
            data : [
                { From : 112, To : 115, Type : 2},
                { From : 111, To : 200, Type : 0}
            ]
        });

        var g = Ext.create('Gnt.panel.Gantt', {
            height              : 600,
            width               : '100%',
            renderTo            : 'example-container',
            rightLabelField     : 'Name',
            highlightWeekends   : false,
//            showTodayLine       : true,
            loadMask            : true,
//            snapToIncrement     : true,
            cascadeChanges      : false,
            
            viewPreset          : 'weekAndDayLetter',
            
            startDate           : new Date(2010, 0, 4),
            endDate             : Sch.util.Date.add(new Date(2014, 0, 4), Sch.util.Date.WEEK, 20),
            
            tbar                : [
                {
                    text        : 'Scroll to 888',
                    
                    handler     : function () {
                        g.getSchedulingView().scrollEventIntoView(taskStore.getById(888), true)
                    }
                },
                {
                    text        : 'Scroll to 111',
                    
                    handler     : function () {
                        g.getSchedulingView().scrollEventIntoView(taskStore.getById(111), true)
                    }
                }
            ],
            
            // Setup your static columns
            columns: [
                {
                    xtype       : 'treecolumn',
                    
                    header      : 'Tasks',
                    sortable    : true,
                    dataIndex   : 'Name',
                    width       : 200,
                    
                    field       : {
                        allowBlank: false
                    }
                },
                {
                    xtype : 'startdatecolumn'
                },
                {
                    xtype : 'enddatecolumn'
                },
                {
                    xtype : 'percentdonecolumn'
                }
            ],

            taskStore           : taskStore,
            dependencyStore     : dependencyStore,
            
            plugins : [
                Ext.create("Gnt.plugin.TaskContextMenu"),
                { ptype : 'bufferedrenderer' }
            ]
        });
    }
};
