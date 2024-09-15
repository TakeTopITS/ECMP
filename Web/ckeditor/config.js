/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here.
    // For complete reference see:
    // http://docs.ckeditor.com/#!/api/CKEDITOR.config

    //config.toolbarGroups = [
    //    { name: 'styles' },
    //    { name: 'colors' },
    //    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
    //    { name: 'paragraph', groups: ['align', 'bidi'] },
    //    { name: 'insert', groups: ['undo'] },
    //    { name: 'document', groups: ['mode'] }
    //];

    config.toolbarGroups = [
        { name: 'styles' },
        { name: 'colors' },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup', 'align'] },
        //{ name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi'] },
 
        //{ name: 'editing', groups: ['find', 'selection', 'spellchecker'] },
        //{ name: 'links' },
        { name: 'insert' },
        //{ name: 'clipboard', groups: ['clipboard'] },
        //{ name: 'forms' },
        //{ name: 'tools' },
        { name: 'document', groups: ['undo', 'mode', 'document', 'doctools'] }
    ];

    config.allowedContent = true;
    config.enterMode = CKEDITOR.ENTER_BR;
    config.shiftEnterMode = CKEDITOR.ENTER_P;

    // Remove some buttons provided by the standard plugins, which are
    // not needed in the Standard(s) toolbar.
    config.removeButtons = 'Underline,Subscript,Superscript';

    // Set the most common block elements.
    config.format_tags = 'p;h1;h2;h3;pre';

    // Simplify the dialog windows.
    config.removeDialogTabs = 'image:advanced;link:advanced';
};
