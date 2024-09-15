(function($){
    var TakeTopFlow = $.TakeTopFlow;

var srcUrl = getUrlParam('IdentifyString');
if (srcUrl == null | srcUrl.length != 16) {
    return;
}

$.extend(true,TakeTopFlow.config.rect,{
	attr : {
	r : 8,
	fill : '#F6F7FF',
	stroke : '#03689A',
	"stroke-width" : 2
}
});

$.extend(true,TakeTopFlow.config.props.props,{
	name : {name:'name', label:'名称', value:'新建流程', editor:function(){return new TakeTopFlow.editors.inputEditor();}},
	key : {name:'key', label:'标识', value:'', editor:function(){return new TakeTopFlow.editors.inputEditor();}},
	desc : {name:'desc', label:'描述', value:'', editor:function(){return new TakeTopFlow.editors.inputEditor();}}
});


$.extend(true,TakeTopFlow.config.tools.states,{
	start : {
				showType: 'image',
				type : 'start',
				name : {text:'<<start>>'},
				text : {text:'开始(Start)'},
				img : {src : 'img/48/start_event_empty.png',width : 48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'开始(Start)'}
				}},
			end : {showType: 'image',type : 'end',
				name : {text:'<<end>>'},
				text : {text:'结束(End)'},
				img : {src : 'img/48/end_event_terminate.png',width : 48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'结束(End)'}
				}},
			'end-cancel' : {showType: 'image',type : 'end-cancel',
				name : {text:'<<end-cancel>>'},
				text : {text:'取消(Cancel)'},
				img : {src : 'img/48/end_event_cancel.png',width : 48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'取消(Cancel)'}
				}},
			'end-error' : {showType: 'image',type : 'end-error',
				name : {text:'<<end-error>>'},
				text : {text:'错误(Error)'},
				img : {src : 'img/48/end_event_error.png',width : 48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'错误(Error)'}
				}},
			state : {showType: 'text',type : 'state',
				name : {text:'<<state>>'},
				text : {text:'状态(Status)'},
				img : {src : 'img/48/task_empty.png',width : 48, height:48},
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'状态(Status)'}
				}},
			fork : {showType: 'image',type : 'fork',
				name : {text:'<<fork>>'},
				text : {text:'分支(Branch)'},
				img : {src : 'img/48/gateway_parallel.png',width :48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
                    text: { name: 'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'分支(Branch)'}
				}},
			join : {showType: 'image',type : 'join',
				name : {text:'<<join>>'},
				text : {text:'合并(Merge)'},
				img : {src : 'img/48/gateway_parallel.png',width :48, height:48},
				attr : {width:50 ,heigth:50 },
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
					text: {name:'text', label: '环节(Link)', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}, value:'合并(Merge)'}
				}},
			task : {showType: 'text',type : 'task',
				name : {text:'<<task>>'},
				text : {text:'步骤(Step)'},
				img : {src : 'img/48/task_empty.png',width :48, height:48},
				props : {
					guid: {name:'guid', label : 'GUID', value:'', editor: function(){return new TakeTopFlow.editors.labelEditor();}},
					text: {name:'text', label: '步骤(Step)', value:'', editor: function(){return new TakeTopFlow.editors.textEditor();}, value:''}
				}}
});
})(jQuery);