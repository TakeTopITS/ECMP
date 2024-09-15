var APIVAR = {
    dependency: {
        read: 'handler/DependencyController.aspx?action=read',
        create: 'handler/DependencyController.aspx?action=create',
        destroy: 'handler/DependencyController.aspx?action=destroy',
        update: 'handler/DependencyController.aspx?action=update'
    },
    task: {
        read: 'handler/TaskController.aspx?action=read',
        create: 'handler/TaskController.aspx?action=create',
        destroy: 'handler/TaskController.aspx?action=destroy',
        update: 'handler/TaskController.aspx?action=update'
    },
    project: {
        read: 'handler/ProjectController.aspx?action=read',
        create: 'handler/ProjectController.aspx?action=create',
        destroy: 'handler/ProjectController.aspx?action=destroy',
        update: 'handler/ProjectController.aspx?action=update'
    },
    resources: {
        read: 'handler/ResourcesController.aspx?action=read',
        create: 'handler/ResourcesController.aspx?action=create',
        destroy: 'handler/ResourcesController.aspx?action=destroy',
        update: 'handler/ResourcesController.aspx?action=update'
    },
    assignment: {
        read: 'handler/AssignmentController.aspx?action=read',
        create: 'handler/AssignmentController.aspx?action=create',
        destroy: 'handler/AssignmentController.aspx?action=destroy',
        update: 'handler/AssignmentController.aspx?action=update'
    },
    T_RelatedUser: {
        read: 'handler/ProjectRelatedUserController.aspx?action=read'
        //create: 'handler/AssignmentController.aspx?action=create',
        //destroy: 'handler/AssignmentController.aspx?action=destroy',
        //update: 'handler/AssignmentController.aspx?action=update'
    },
    T_JNUnit: {
        read: 'handler/ProjectRelatedUnitController.aspx?action=read'
        //create: 'handler/AssignmentController.aspx?action=create',
        //destroy: 'handler/AssignmentController.aspx?action=destroy',
        //update: 'handler/AssignmentController.aspx?action=update'
    },
    url: {
        gantt:"Gantt.aspx",
        upload:"Upload.aspx"
    }

}

/*如果采用web service的方式， 可以使用以下的配置*/
//var APIVAR = {
//	dependency:	{
//            read: 'webservices/Dependencies.asmx/Get',
//            create: 'webservices/Dependencies.asmx/Create',
//            destroy: 'webservices/Dependencies.asmx/Delete',
//            update: 'webservices/Dependencies.asmx/Update'
//    },
//    task: {
//        read: 'webservices/Tasks.asmx/Get',
//        create: 'webservices/Tasks.asmx/Create',
//        destroy: 'webservices/Tasks.asmx/Delete',
//        update: 'webservices/Tasks.asmx/Update'
//    },
//    project: {
//        read: 'webservices/Projects.asmx/Get',
//        create: 'webservices/Projects.asmx/Create',
//        destroy: 'webservices/Projects.asmx/Delete',
//        update: 'webservices/Projects.asmx/Update'
//    }
//    
//}
