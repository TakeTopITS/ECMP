var APIVAR = {
	dependency:	{
		read : 'dependencies!list.action?pid=' + pid,
		create : 'dependencies!create.action',
		destroy : 'dependencies!delete.action'
    },
    task: {
    	read : 'task!list.action?pid=' + pid,
		create : 'task!create.action?pid=' + pid,
		destroy : 'task!delete.action',
		update : 'task!updata.action'
    },
    
    assignment: {
		read : 'task!assignment.action',
		create : 'task!assignmentCreate.action',
		update : 'task!updata.action'
	}
	
	
    
}
