var APIVAR = {
	dependency:	{
		read : 'data-no-db/dependency.json',
		create : '',
		destroy : ''
    },
    task: {
    	read : 'data-no-db/task.json',
		create : '',
		destroy : '',
		update : ''
    },
    
    assignment: {
		read : 'task!assignment.action',
		create : 'task!assignmentCreate.action',
		update : 'task!updata.action'
	}
}
