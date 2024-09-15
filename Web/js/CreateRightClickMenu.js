/*----把下面css放面页面----*/

//  .context - menu {
//    display: none;
//    position: absolute;
//    background - color: white;
//    border: 1px solid gray;
//    padding: 5px;
//    z - index: 9999;
//}

//            .context - menu a {
//    display: block;
//    padding: 5px;
//    text - decoration: none;
//    color: black;
//}

//                .context - menu a:hover {
//    background - color: #f5f5f5;
//}

 ////------把下面div放入页面------
 //  <div id="contextMenu" class="context-menu">
 //      <!-- Context menu items will be dynamically added here -->
 //  </div>


/*  ---------------生成右键菜单--------------*/
$(document).ready(

    function () {
        const svgContainer = $('svg');
        const contextMenu = $('#contextMenu');

        // Listen for right-click events on the SVG container
        svgContainer.on('contextmenu', function (event) {
            // Prevent the default context menu from showing
            event.preventDefault();

            // Get the fill property of the clicked element
            const targetElement = findElementByFill(event, '#90ee90');
            const fillProperty = targetElement ? targetElement.getAttribute('fill') : null;

            // If the element with the specified fill value is found, proceed
            if (fillProperty) {

                // Send an AJAX request to the server-side handler
                $.ajax({
                    url: '../Handler/GetPageModuleDataForGanttChartRightMemu.ashx?LangCode=zh-CN',
                    type: 'GET',
                    data: { fill: fillProperty }, // Pass the fill property as a parameter
                    success: function (response) {
                        // Clear any existing menu items
                        contextMenu.empty();

                        // Populate the context menu with data from the server response
                        populateContextMenu(response);

                        // Position and show the context menu
                        const mouseX = event.clientX;
                        const mouseY = event.clientY;
                        contextMenu.css({
                            top: mouseY,
                            left: mouseX,
                            display: 'block'
                        });
                    },
                    error: function (error) {
                        console.error('Error fetching data:', error);
                    }
                });
            } else {
                console.log('No element with the specified fill was found.');
            }
        });

        // Function to populate the context menu
        function populateContextMenu(responseJson) {

            /* alert(data);*/

            if (responseJson) {

                var obj = JSON.parse(responseJson);

                for (var i = 0; i < obj.length; i++) {

                    var item = obj[i];

                    /*   alert(item.homemodulename);*/


                    var label = item.modulelabel + 'label';

                    const menuItem = $('<a>').text(item.homemodulename).attr('href', item.pagename).appendTo(contextMenu);

                    menuItem.on('click', function (event) {
                        // Optionally prevent default behavior (opening the link in the same tab)
                        // event.preventDefault();
                        // Open the link in a new tab or window
                        window.open(item.pagename, '_blank');
                    });

                }
            }
        }

        // Function to find the element by its fill property
        function findElementByFill(event, fillValue) {

            const targetElement = event.target;

            if (targetElement && targetElement.tagName.toLowerCase() === 'rect' && targetElement.getAttribute('fill') === fillValue) {

                return targetElement;
            }

            return null;
        }

        // Hide the context menu when clicking outside of it
        $(document).on('click', function (event) {
            if (!$(event.target).closest('#contextMenu').length) {
                contextMenu.hide();
            }
        });
    });

