/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    //config.language = 'en';
    //config.uiColor = '#AADC6E';

    //config.uiColor = '#eef5fd';

    config.width = 400; //宽度
    config.height = 50; //高度

    config.font_names = 'Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana;宋体;楷体_GB2312;新宋体;黑体;隶书;幼圆;微软雅黑;';

    config.toolbar_Full =
     [
         ['Source'],
        
         ['Bold', 'Italic', 'Underline', 'Strike'],
         ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar'],
         //['Styles', 'Format'],
         ['Font', 'FontSize'],
         ['TextColor', 'BGColor'],
         //['Maximize', 'ShowBlocks', '-', 'About']
         //['-', 'Find', 'Replace'],
         //['-', 'SelectAll', 'RemoveFormat'],
         //['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
          //['-', 'Preview', '-', 'Templates'],
         ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
         //['-', 'Print', 'SpellChecker', 'Scayt'],
         ['Undo', 'Redo'],
         //['Link', 'Unlink', 'Anchor'],
         //'/',
        
         //['-', 'Subscript', 'Superscript'],
         //['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv'],        
       
         //['PageBreak']

     ];
};
