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
        Gnt.widget.DurationField.prototype.invalidText = "錯誤的工期值";
    }

    if (Gnt.feature.DependencyDragDrop) {
        Gnt.feature.DependencyDragDrop.prototype.fromText = '從: <strong>{0}</strong> {1}<br/>';
        Gnt.feature.DependencyDragDrop.prototype.toText = '到: <strong>{0}</strong> {1}';
        Gnt.feature.DependencyDragDrop.prototype.startText = '開始';
        Gnt.feature.DependencyDragDrop.prototype.endText = '結束';
    }

    if (Gnt.Tooltip) {
        Gnt.Tooltip.prototype.startText = '開始: ';
        Gnt.Tooltip.prototype.endText = '結束: ';
        Gnt.Tooltip.prototype.durationText = '工期:';
        Gnt.Tooltip.prototype.dayText = '天';
    }


    if (Gnt.plugin.TaskContextMenu) {

        Gnt.plugin.TaskContextMenu.prototype.texts = {
            newTaskText: '新建計劃',
            newMilestoneText: '新建里程碑',
            convertToMilestone: '轉里程碑',
            deleteTask: '刪除計劃',
            editLeftLabel: '修改左邊標簽',
            editRightLabel: '修改右邊標簽',
            add: '添加...',
            deleteDependency: '刪除前后置關系...',
            addTaskAbove: '到上方',
            addTaskBelow: '到下方',
            addMilestone: '里程碑',
            addSubtask: '子節點',
            addSuccessor: '后繼計劃',
            addPredecessor: '前置計劃'
        };
        Ext.Ajax.request({
            url: 'Handler/GetPageModuleDataForGanttChartRightMemu.ashx?LangCode=zh-tw',
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
            fromText: '從',
            toText: '到',
            typeText: '類型',
            lagText: '延遲',
            endToStartText: '結束開始',
            startToStartText: '開始開始',
            endToEndText: '結束結束结',
            startToEndText: '開始結束'
        });
    }

    if (Gnt.widget.calendar.Calendar) {
        Gnt.widget.calendar.Calendar.override({
            dayOverrideNameHeaderText: '名稱',
            dateText: '日期',
            addText: '添加',
            editText: '編輯',
            removeText: '删除',
            workingDayText: '工作日',
            weekendsText: '周末',
            overriddenDayText: '過載天',
            overriddenWeekText: '過載周',
            defaultTimeText: '默認時間',
            workingTimeText: '工作時間',
            nonworkingTimeText: '非工作時間',
            dayOverridesText: '過載的天',
            weekOverridesText: '過載的周',
            okText: '確定',
            cancelText: '取消',
            parentCalendarText: '父日曆',
            noParentText: '無父日曆',
            selectParentText: '靖遠擇父日曆',
            newDayName: '[未命名]',
            calendarNameText: '日曆名稱',
            tplTexts: {
                tplWorkingHours: '工時',
                tplIsNonWorking: '非工作的',
                tplOverride: '過載',
                tplInCalendar: '在日曆中',
                tplDayInCalendar: '日曆中標準'
            },
            overrideErrorText: '日期已過載',
            intersectDatesErrorText: "日期不能交叉包含",
            startDateErrorText: '開始時間比結束時間晚'
        });
    }

    if (Gnt.widget.calendar.DayAvailabilityGrid) {
        Gnt.widget.calendar.DayAvailabilityGrid.override({
            startText: '開始',
            endText: '結束',
            addText: '添加',
            removeText: '刪除',
            workingTimeText: '工作時間',
            nonworkingTimeText: '非工作時間'
        });
    }

    if (Gnt.widget.calendar.DayGrid) {
        Gnt.widget.calendar.DayGrid.override({
            nameText: '名稱',
            dateText: '日期',
            noNameText: '[未命名日期]'
        });
    }

    if (Gnt.widget.calendar.WeekEditor) {
        Gnt.widget.calendar.WeekEditor.override({
            startHeaderText: '開始',
            endHeaderText: '結束',
            defaultTimeText: '默認時間',
            workingTimeText: '工作時间',
            nonworkingTimeText: '非工作時間',
            addText: '添加',
            removeText: '删除'
        });
    }

    if (Gnt.widget.calendar.WeekGrid) {
        Gnt.widget.calendar.WeekGrid.override({
            nameText: '名称',
            startDateText: '开始时期',
            endDateText: '结束日期'
        });
    }

    if (Gnt.widget.AssignmentField) {
        Gnt.widget.AssignmentField.override({
            cancelText: '取消',
            closeText: '保存并關閉'
        });
    }

    if (Gnt.widget.Calendar) {
        Gnt.widget.Calendar.override({
            disabledDatesText: '節假日'
        });
    }

    if (Gnt.column.AssignmentUnits) {
        Gnt.column.AssignmentUnits.override({
            text: '單位'
        });
    }

    if (Gnt.column.Duration) {
        Gnt.column.Duration.override({
            text: '工期'
        });
    }

    if (Gnt.column.Effort) {
        Gnt.column.Effort.override({
            text: '投入'
        });
    }

    if (Gnt.column.EndDate) {
        Gnt.column.EndDate.override({
            text: '完成'
        });
    }

    if (Gnt.column.PercentDone) {
        Gnt.column.PercentDone.override({
            text: '%完成'
        });
    }

    if (Gnt.column.ResourceAssignment) {
        Gnt.column.ResourceAssignment.override({
            text: '已分配資源'
        });
    }

    if (Gnt.column.ResourceName) {
        Gnt.column.ResourceName.override({
            text: '資源名稱'
        });
    }

    if (Gnt.column.SchedullingMode) {
        Gnt.column.SchedullingMode.override({
            text: '模式'
        });
    }

    if (Gnt.column.Predecessor) {
        Gnt.column.Predecessor.override({
            text: '前置計劃'
        });
    }

    if (Gnt.column.Successor) {
        Gnt.column.Successor.override({
            text: '后續計劃'
        });
    }

    if (Gnt.column.StartDate) {
        Gnt.column.StartDate.override({
            text: '開始'
        });
    }

    if (Gnt.column.WBS) {
        Gnt.column.WBS.override({
            text: '#'
        });
    }

    if (Gnt.widget.taskeditor.TaskForm) {
        Gnt.widget.taskeditor.TaskForm.override({
            taskNameText: '名稱',
            durationText: '工期',
            datesText: '日期',
            baselineText: '基線',
            startText: '開始',
            finishText: '結束',
            percentDoneText: '完成百份比',
            baselineStartText: '開始',
            baselineFinishText: '結束',
            baselinePercentDoneText: '基准百分比',
            effortText: '工時',
            invalidEffortText: '錯誤的投入值',
            calendarText: '日曆',
            schedulingModeText: '排程模式',
            leaderCodeText: '負責人代碼',
            leaderText: '負責人',

            workhourText: '計劃工時',
            actualhourText: '實際工時',

            requireNumberText: '要求數量',
            finishedNumberText: '已完成量',
            priceText: '單價',
            unitNameText: '單位',

            budgetText: '預算',
            expenseText: '實際費用',

            priorityText: '優先級',
            NoteText: '備注'
        });
    }

    if (Gnt.widget.DependencyGrid) {
        Gnt.widget.DependencyGrid.override({
            idText: 'ID編號',
            taskText: '計劃名稱',
            blankTaskText: '請選擇計劃',
            invalidDependencyText: '錯誤的依賴關系',
            parentChildDependencyText: '父子節點含有依賴關系',
            duplicatingDependencyText: '有重復的依賴關系',
            transitiveDependencyText: '存在傳遞的依賴關系',
            cyclicDependencyText: '依賴關系中存在環路',
            typeText: '類型',
            lagText: '延隔時間',
            clsText: 'CSS類',
            endToStartText: '結束開始',
            startToStartText: '開始開始',
            endToEndText: '結束結束',
            startToEndText: '開始結束'
        });
    }

    if (Gnt.widget.AssignmentEditGrid) {
        Gnt.widget.AssignmentEditGrid.override({
            confirmAddResourceTitle: '確認',
            confirmAddResourceText: '未找到{0}相關資源。要新建資源?',
            noValueText: '請選擇要分配的資源。',
            noResourceText: '未找到{0}相關資源。'
        });
    }

    if (Gnt.widget.taskeditor.TaskEditor) {
        Gnt.widget.taskeditor.TaskEditor.override({
            generalText: '常規',
            resourcesText: '資源',
            dependencyText: '前置計劃',
            addDependencyText: '添加',
            dropDependencyText: '刪除',
            notesText: '備注',
            advancedText: '高級',
            wbsCodeText: 'WBS代碼',
            addAssignmentText: '添加',
            dropAssignmentText: '刪除',
            noteText: '備注'
        });
    }

    if (Gnt.plugin.TaskEditor) {
        Gnt.plugin.TaskEditor.override({
            title: '計劃信息',
            alertCaption: '信息',
            alertText: '請在保存前修改相關錯誤',
            okText: '確定',
            cancelText: '取消'
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
            Sch.plugin.CurrentTimeLine.prototype.tooltipText = '當前時間';
        }
    }

    var M = Sch.preset.Manager,
        vp = M.getPreset("hourAndDay");

    if (vp) {
        vp.displayDateFormat = 'g:i A';
        vp.headerConfig.middle.dateFormat = 'g A';
        vp.headerConfig.top.dateFormat = 'Y年m月d日';
    }

    vp = M.getPreset("dayAndWeek");
    if (vp) {
        vp.displayDateFormat = 'm/d h:i A';
        vp.headerConfig.middle.dateFormat = 'Y年m月d日';
        vp.headerConfig.top.renderer = function (start, end, cfg) {
            var w = start.getWeekOfYear();
            return 'w.' + ((w < 10) ? '0' : '') + w + ' ' + Sch.util.Date.getShortMonthName(start.getMonth()) + ' ' + start.getFullYear();
        };
    }

    vp = M.getPreset("weekAndDay");
    if (vp) {
        vp.displayDateFormat = 'm月d日';
        vp.headerConfig.bottom.dateFormat = 'm月d日';
        vp.headerConfig.middle.dateFormat = 'Y年m月d日';
    }

    vp = M.getPreset("weekAndDayLetter");
    if (vp) {
        vp.displayDateFormat = 'm月d日';
        vp.headerConfig.bottom.dateFormat = 'M月d日';
        vp.headerConfig.bottom.renderer = function (start, end, cfg) {
            //将星期一变为一
            return Ext.Date.dayNames[start.getDay()].substr(2, 1);
        };
        vp.headerConfig.middle.dateFormat = 'Y年m月d日';
    }

    vp = M.getPreset("weekAndMonth");
    if (vp) {
        vp.displayDateFormat = 'Y年m月d日';
        vp.headerConfig.middle.dateFormat = 'm月d日';
        vp.headerConfig.middle.renderer = function (start, end, cfg) {
            cfg.align = 'left';
            return Ext.Date.format(start, 'm月d日');
        };
        vp.headerConfig.top.dateFormat = 'Y年m月d日';

    }

    vp = M.getPreset("monthAndYear");
    if (vp) {
        vp.displayDateFormat = 'Y年m月d日';
        vp.headerConfig.middle.dateFormat = 'Y年m月';
        vp.headerConfig.top.dateFormat = 'Y年';
    }

    vp = M.getPreset("year");
    if (vp.year) {
        vp.displayDateFormat = 'Y年m月d日';
        vp.headerConfig.bottom.renderer = function (start, end, cfg) {
            return Ext.String.format('{0}季度', Math.floor(start.getMonth() / 3) + 1);
        };
        vp.headerConfig.middle.dateFormat = 'Y年';
    }

});