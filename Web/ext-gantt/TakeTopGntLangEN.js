/*

TakeTop 2010-2016

*/
/**
 * English translations for the Gantt component
 *
 * NOTE: To change locale for month/day names you have to use the Ext JS language pack.
 */
Ext.onReady(function () {
    //修改下面的参数，会导致parser不正确
    //    if (Gnt.util.DurationParser){
    //        Gnt.util.DurationParser.prototype.unitsRegex = {
    //            MILLI       : /^ms$|^毫秒/i,
    //            SECOND      : /^s$|^秒/i,
    //            MINUTE      : /^m$|^分/i,
    //            HOUR        : /^h$|^hr$|^小时/i,
    //            DAY         : /^d$|^天/i,
    //            WEEK        : /^w$|^wk|^周/i,
    //            MONTH       : /^mo|^月/i,
    //            QUARTER     : /^q$|^quar|^季度/i,
    //            YEAR        : /^y$|^yr|^年/i
    //        };
    //    }

    if (Gnt.widget.DurationField) {
        Gnt.widget.DurationField.prototype.invalidText = "Invalid duration value";
    }

    if (Gnt.feature.DependencyDragDrop) {
        Gnt.feature.DependencyDragDrop.prototype.fromText = 'From: <strong>{0}</strong> {1}<br/>';
        Gnt.feature.DependencyDragDrop.prototype.toText = 'To: <strong>{0}</strong> {1}';
        Gnt.feature.DependencyDragDrop.prototype.startText = 'Start';
        Gnt.feature.DependencyDragDrop.prototype.endText = 'End';
    }

    if (Gnt.Tooltip) {
        Gnt.Tooltip.prototype.startText = 'Starts: ';
        Gnt.Tooltip.prototype.endText = 'Ends: ';
        Gnt.Tooltip.prototype.durationText = 'Duration:';
        Gnt.Tooltip.prototype.dayText = 'Day';
    }

    if (Gnt.plugin.TaskContextMenu) {

        Gnt.plugin.TaskContextMenu.prototype.texts = {
            newTaskText: 'New Plan',
            newMilestoneText: ' New Milestone',
            convertToMilestone: 'Convert To Milestone',
            deleteTask: 'Delete Plan',
            editLeftLabel: 'Edit Left Label',
            editRightLabel: 'Edit Right Label',
            add: 'Add...',
            deleteDependency: 'Delete Dependency...',
            addTaskAbove: 'Add Plan Above',
            addTaskBelow: 'Add Plan Below',
            addMilestone: 'Add Milestone',
            addSubtask: 'Add Subtask',
            addSuccessor: 'Add Successor',
            addPredecessor: 'Add Predecessor'
        };
        Ext.Ajax.request({
            url: 'Handler/GetPageModuleDataForGanttChartRightMemu.ashx?LangCode=en',
            method: 'GET',
            async: false,
            callback: function (options, success, response) {
                if (success) {

                    var responseJson = Ext.JSON.decode(response.responseText);
                    if (responseJson) {
                        for (var i = 0; i < responseJson.length; i++) {
                            var item = responseJson[i];

                            try {
                                var itemHomeModuleName = item.homemodulename;

                                Gnt.plugin.TaskContextMenu.prototype.texts[item.modulelabel] = item.homemodulename.replace(/(\s*$)/g, "");
                            }
                            catch (err) {
                                var txt = "此页面存在一个错误。\n\n";
                                txt += "错误描述: " + err.description + "\n\n";
                                txt += "点击OK继续。\n\n";
                                alert(txt)
                            }
                        }
                    }

                } else {
                    console.log(response);
                }
            }
        });
    }

    if (Gnt.plugin.DependencyEditor) {
        Gnt.plugin.DependencyEditor.override({
            fromText: 'From',
            toText: 'To',
            typeText: 'Type',
            lagText: 'Lag',
            endToStartText: ' End To Start',
            startToStartText: 'Start To Start',
            endToEndText: 'End To End',
            startToEndText: 'Start To End'
        });
    }

    if (Gnt.widget.calendar.Calendar) {
        Gnt.widget.calendar.Calendar.override({
            dayOverrideNameHeaderText: 'Name',
            dateText: 'Date',
            addText: 'Add',
            editText: 'Edit',
            removeText: 'Remove',
            workingDayText: 'Working Day',
            weekendsText: 'Week Ends',
            overriddenDayText: 'Overridden Day',
            overriddenWeekText: 'Overridden Week',
            defaultTimeText: 'Default Time',
            workingTimeText: 'Working Time',
            nonworkingTimeText: 'Non-working Time',
            dayOverridesText: 'Day Overrides',
            weekOverridesText: 'Week Overrides',
            okText: 'Ok',
            cancelText: 'Cancel',
            parentCalendarText: ' Parent Calendar',
            noParentText: 'No Parent',
            selectParentText: 'Select Parent',
            newDayName: '[Without name]',
            calendarNameText: 'Calendar name',
            tplTexts: {
                tplWorkingHours: 'Working Hours',
                tplIsNonWorking: 'Is Non Working',
                tplOverride: 'Override',
                tplInCalendar: 'InCalendar',
                tplDayInCalendar: 'Day In Calendar'
            },
            overrideErrorText: 'There is already an override for this day',
            intersectDatesErrorText: "Week overrides should not intersect",
            startDateErrorText: 'Start date should be less than end date'
        });
    }

    if (Gnt.widget.calendar.DayAvailabilityGrid) {
        Gnt.widget.calendar.DayAvailabilityGrid.override({
            startText: 'Start',
            endText: 'End',
            addText: 'Add',
            removeText: 'Delete',
            workingTimeText: ' Working Time',
            nonworkingTimeText: 'Non-Working Time'
        });
    }

    if (Gnt.widget.calendar.DayGrid) {
        Gnt.widget.calendar.DayGrid.override({
            nameText: 'Name',
            dateText: 'Date',
            noNameText: '[No Name Date]'
        });
    }

    if (Gnt.widget.calendar.WeekEditor) {
        Gnt.widget.calendar.WeekEditor.override({
            startHeaderText: 'Start',
            endHeaderText: 'End',
            defaultTimeText: 'Default Time',
            workingTimeText: 'working Time',
            nonworkingTimeText: ' Non-WorkingTime',
            addText: 'Add',
            removeText: 'Remove'
        });
    }

    if (Gnt.widget.calendar.WeekGrid) {
        Gnt.widget.calendar.WeekGrid.override({
            nameText: 'Name',
            startDateText: 'Start Date',
            endDateText: 'End Date'
        });
    }

    if (Gnt.widget.AssignmentField) {
        Gnt.widget.AssignmentField.override({
            cancelText: 'Cancel',
            closeText: 'Save&End'
        });
    }

    if (Gnt.widget.Calendar) {
        Gnt.widget.Calendar.override({
            disabledDatesText: 'Holidays and Festivals'
        });
    }

    if (Gnt.column.AssignmentUnits) {
        Gnt.column.AssignmentUnits.override({
            text: 'Units'
        });
    }

    if (Gnt.column.Duration) {
        Gnt.column.Duration.override({
            text: 'Duration'
        });
    }

    if (Gnt.column.Effort) {
        Gnt.column.Effort.override({
            text: 'Effort'
        });
    }

    if (Gnt.column.EndDate) {
        Gnt.column.EndDate.override({
            text: 'EndDate'
        });
    }

    if (Gnt.column.PercentDone) {
        Gnt.column.PercentDone.override({
            text: '%PercentDone'
        });
    }

    if (Gnt.column.ResourceAssignment) {
        Gnt.column.ResourceAssignment.override({
            text: 'Resource Assignment'
        });
    }

    if (Gnt.column.ResourceName) {
        Gnt.column.ResourceName.override({
            text: 'Resource Name'
        });
    }

    if (Gnt.column.SchedullingMode) {
        Gnt.column.SchedullingMode.override({
            text: 'SchedullingMode'
        });
    }

    if (Gnt.column.Predecessor) {
        Gnt.column.Predecessor.override({
            text: 'Predecessor Plan'
        });
    }

    if (Gnt.column.Successor) {
        Gnt.column.Successor.override({
            text: 'Successor Plan'
        });
    }

    if (Gnt.column.StartDate) {
        Gnt.column.StartDate.override({
            text: 'Start'
        });
    }

    if (Gnt.column.WBS) {
        Gnt.column.WBS.override({
            text: '#'
        });
    }

    if (Gnt.widget.taskeditor.TaskForm) {
        Gnt.widget.taskeditor.TaskForm.override({
            taskNameText: 'Name',
            durationText: 'Duration',
            datesText: 'Dates',
            baselineText: 'Baseline',
            startText: 'Start',
            finishText: 'Finish',
            percentDoneText: 'Percent Done',
            baselineStartText: 'Baseline Start',
            baselineFinishText: 'Baseline Finish',
            baselinePercentDoneText: 'Baseline PercentDone',
            effortText: ' Effort',
            invalidEffortText: 'invalid Effort',
            calendarText: 'Calendar',
            schedulingModeText: 'Scheduling Mode',
            leaderCodeText: 'Leader Code',
            leaderText: ' Leader',

            workhourText: 'Plan Workhour',
            actualhourText: 'Actual Workhour',

            requireNumberText: 'Require Number',
            finishedNumberText: 'Finished Number',
            priceText: 'Price',
            unitNameText: 'UnitName',

            budgetText: 'Budget',
            expenseText: 'Expense',

            priorityText: 'Priority',
            NoteText: 'Note'
        });
    }

    if (Gnt.widget.DependencyGrid) {
        Gnt.widget.DependencyGrid.override({
            idText: 'ID',
            taskText: 'Plan',
            blankTaskText: 'Please Select Plan',
            invalidDependencyText: 'Invalid Dependency',
            parentChildDependencyText: 'Parent Child Dependency',
            duplicatingDependencyText: 'Duplicating Dependency',
            transitiveDependencyText: 'Transitive Dependency',
            cyclicDependencyText: 'Cyclic Dependency',
            typeText: 'Type',
            lagText: 'Lag',
            clsText: 'CSS Class',
            endToStartText: 'Finish-To - Start',
            startToStartText: 'Start-To-Start',
            endToEndText: 'Finish-To-Finish',
            startToEndText: 'Start-To-Finish'
        });
    }

    if (Gnt.widget.AssignmentEditGrid) {
        Gnt.widget.AssignmentEditGrid.override({
            confirmAddResourceTitle: 'Confirm',
            confirmAddResourceText: 'Resource &quot;{0}&quot; not found in list. Would you like to add it?',
            noValueText: 'Please select resource to assign。',
            noResourceText: 'No resource &quot;{0}&quot; found in the list。'
        });
    }

    if (Gnt.widget.taskeditor.TaskEditor) {
        Gnt.widget.taskeditor.TaskEditor.override({
            generalText: 'General',
            resourcesText: 'Resources',
            dependencyText: 'Predecessors',
            addDependencyText: 'Add new',
            dropDependencyText: 'Remove',
            notesText: 'Notes',
            advancedText: 'Advanced',
            wbsCodeText: 'WBS code',
            addAssignmentText: 'Add new',
            dropAssignmentText: 'Delete',
            noteText: 'Note'
        });
    }

    if (Gnt.plugin.TaskEditor) {
        Gnt.plugin.TaskEditor.override({
            title: 'Plan Information',
            alertCaption: 'Information',
            alertText: 'Please correct marked errors to save changes',
            okText: 'Ok',
            cancelText: 'Cancel'
        });
    }

    /////////////////////////////以下是原有的汉化程序///////////////////////////////////////////////////////////
    if (Sch.plugin) {
        if (Sch.plugin.SummaryColumn) {
            Ext.override(Sch.plugin.SummaryColumn, {
                dayText: 'd',
                hourText: 'h',
                minuteText: 'min'
            });
        }

        if (Sch.plugin.CurrentTimeLine) {
            Sch.plugin.CurrentTimeLine.prototype.tooltipText = 'Current Time';
        }
    }

    var M = Sch.preset.Manager,
        vp = M.getPreset("hourAndDay");

    if (vp) {
        vp.displayDateFormat = 'g:i A';
        vp.headerConfig.middle.dateFormat = 'g A';
        vp.headerConfig.top.dateFormat = 'Y-m-d';
    }

    vp = M.getPreset("dayAndWeek");
    if (vp) {
        vp.displayDateFormat = 'm/d h:i A';
        vp.headerConfig.middle.dateFormat = 'Y-m-d';
        vp.headerConfig.top.renderer = function (start, end, cfg) {
            var w = start.getWeekOfYear();
            return 'w.' + ((w < 10) ? '0' : '') + w + ' ' + Sch.util.Date.getShortMonthName(start.getMonth()) + ' ' + start.getFullYear();
        };
    }

    vp = M.getPreset("weekAndDay");
    if (vp) {
        vp.displayDateFormat = 'm-d';
        vp.headerConfig.bottom.dateFormat = 'm-d';
        vp.headerConfig.middle.dateFormat = 'Y-m-d';
    }

    vp = M.getPreset("weekAndDayLetter");
    if (vp) {
        vp.displayDateFormat = 'm-d';
        vp.headerConfig.bottom.dateFormat = 'M-d';
        vp.headerConfig.bottom.renderer = function (start, end, cfg) {
            //将星期一变为一
            return Ext.Date.dayNames[start.getDay()].substr(2, 1);
        };
        vp.headerConfig.middle.dateFormat = 'Y-m-d';
    }

    vp = M.getPreset("weekAndMonth");
    if (vp) {
        vp.displayDateFormat = 'Y-m-d';
        vp.headerConfig.middle.dateFormat = 'm-d';
        vp.headerConfig.middle.renderer = function (start, end, cfg) {
            cfg.align = 'left';
            return Ext.Date.format(start, 'm-d');
        };
        vp.headerConfig.top.dateFormat = 'Y-m-d';

    }

    vp = M.getPreset("monthAndYear");
    if (vp) {
        vp.displayDateFormat = 'Y-m-d';
        vp.headerConfig.middle.dateFormat = 'Y-m-';
        vp.headerConfig.top.dateFormat = 'Y-';
    }

    vp = M.getPreset("year");
    if (vp.year) {
        vp.displayDateFormat = 'Y-m-d';
        vp.headerConfig.bottom.renderer = function (start, end, cfg) {
            return Ext.String.format('{0}Quarterly', Math.floor(start.getMonth() / 3) + 1);
        };
        vp.headerConfig.middle.dateFormat = 'Y-';
    }

});