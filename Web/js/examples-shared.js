var ExampleDefaults = {
    width   : 800,
    height  : 400
};

Ext.onReady(function() {
    if (window.top !== window) {
        Ext.getBody().addCls('bry-examples-framed');
    }
});
