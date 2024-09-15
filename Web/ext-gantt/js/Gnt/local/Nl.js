/*

Ext Gantt 2.2.25
Copyright(c) 2009-2014 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
Ext.define('Gnt.locale.Nl', {
    extend      : 'Sch.locale.Locale',
    requires    : 'Sch.locale.Nl',
    singleton   : true,

    constructor : function (config) {

        Ext.apply(this, {
            l10n        : {
                'Gnt.util.DurationParser' : {
                    unitsRegex : {
                        MILLI       : /^ms$|^mil/i,
                        SECOND      : /^s$|^sec/i,
                        MINUTE      : /^m$|^min/i,
                        HOUR        : /^u$|^uur$|^uren/i,
                        DAY         : /^d$|^dag/i,
                        WEEK        : /^w$|^wk|^week|^weken/i,
                        MONTH       : /^ma|^mnd|^m/i,
                        QUARTER     : /^k$|^kwar|^kwt|^kw/i,
                        YEAR        : /^j$|^jr|^jaar|^jaren/i
                    }
                },

                'Gnt.util.DependencyParser' : {
                    typeText    : {
                        SS  : 'GB',
                        SF  : 'EB',
                        FS  : 'BE',
                        FF  : 'GE'
                    }
                },

                'Gnt.field.Duration' : {
                    invalidText : 'Ongeldige tijdsduur'
                },

                'Gnt.field.Effort' : {
                    invalidText : 'Ongeldige inspanning'
                },

                'Gnt.field.Percent' : {
                    invalidText : 'Ongeldig percentage'
                },

                'Gnt.feature.DependencyDragDrop' : {
                    fromText    : 'Van',
                    toText      : 'Tot',
                    startText   : 'Start',
                    endText     : 'Einde'
                },

                'Gnt.Tooltip' : {
                    startText       : 'Begin: ',
                    endText         : 'Einde: ',
                    durationText    : 'Duur: '
                },

                'Gnt.plugin.TaskContextMenu' : {
                    taskInformation     : 'Taak informatie...',
                    newTaskText         : 'Nieuwe taak',
                    deleteTask          : 'Verwijder taak/taken',
                    editLeftLabel       : 'Bewerk linker label',
                    editRightLabel      : 'Bewerk rechter label',
                    add                 : 'Voeg toe...',
                    deleteDependency    : 'Verwijder afhankelijkheid...',
                    addTaskAbove        : 'Bovenliggende taak',
                    addTaskBelow        : 'Onderliggende Taak',
                    addMilestone        : 'Mijlpaal',
                    addSubtask          : 'Sub-taak',
                    addSuccessor        : 'Opvolgende',
                    addPredecessor      : 'Voorgaande',
                    convertToMilestone  : 'Converteren naar mijlpaal',
                    convertToRegular    : 'Converteren naar reguliere taak'
                },

                'Gnt.plugin.DependencyEditor' : {
                    fromText            : 'Van',
                    toText              : 'Tot',
                    typeText            : 'Type',
                    lagText             : 'Achterstand',//?
                    endToStartText      : 'Einde-Tot-Start',
                    startToStartText    : 'Begin-Tot-Begin',
                    endToEndText        : 'Einde-Tot-Einde',
                    startToEndText      : 'Begin-Tot-Einde'
                },

                'Gnt.widget.calendar.Calendar' : {
                    dayOverrideNameHeaderText : 'Naam',
                    overrideName        : 'Naam',
                    startDate           : 'Startdatum',
                    endDate             : 'Einddatum',
                    error               : 'Fout',
                    dateText            : 'Datum',
                    addText             : 'Toevoegen',
                    editText            : 'Bewerken',
                    removeText          : 'Verwijderen',
                    workingDayText      : 'Werkdag',
                    weekendsText        : 'Weekends',
                    overriddenDayText   : 'Overschreven dag',
                    overriddenWeekText  : 'Overschreven week',
                    workingTimeText     : 'Werktijd',
                    nonworkingTimeText  : 'Buiten-werktijd',
                    dayOverridesText    : 'Overschreven dag',
                    weekOverridesText   : 'Overschreven Week',
                    okText              : 'OK',
                    cancelText          : 'Annuleer',
                    parentCalendarText  : 'Bovenliggende kalender',
                    noParentText        : 'Geen bovenliggende',
                    selectParentText    : 'Selecteer bovenliggende',
                    newDayName          : '[Zonder naam]',
                    calendarNameText    : 'Kalender naam',
                    tplTexts            : {
                        tplWorkingHours : 'Werktijden voor',
                        tplIsNonWorking : 'is non-actief',
                        tplOverride     : 'overschreven',
                        tplInCalendar   : 'in kalender',
                        tplDayInCalendar: 'standaard dag in kalender',
                        tplBasedOn      : 'Gebaseerd op'
                    },
                    overrideErrorText   : 'Er is al een overschrijving voor deze dag',
                    overrideDateError   : 'Er is al een overschrijving voor deze datum: {0}',
                    startAfterEndError  : 'Startdatum moet eerder zijn dan de  einddatum',
                    weeksIntersectError : 'Week overschrijvingen mogen elkaar niet overschrijden'
                },

                'Gnt.widget.calendar.AvailabilityGrid' : {
                    startText           : 'Start',
                    endText             : 'Einde',
                    addText             : 'Voeg toe',
                    removeText          : 'Verwijder',
                    error               : 'Fout'
                },

                'Gnt.widget.calendar.DayEditor' : {
                    workingTimeText     : 'Werktijd',
                    nonworkingTimeText  : 'Buiten werktijd'
                },

                'Gnt.widget.calendar.WeekEditor' : {
                    defaultTimeText     : 'Standaard tijd',
                    workingTimeText     : 'Werktijd',
                    nonworkingTimeText  : 'Buiten werktijd',
                    error               : 'Fout',
                    noOverrideError     : "Week overschrijving bevat alleen 'standaard' dagen - kan niet opslaan"
                },

                'Gnt.widget.calendar.ResourceCalendarGrid' : {
                    name        : 'Naam',
                    calendar    : 'Kalender'
                },

                'Gnt.widget.calendar.CalendarWindow' : {
                    ok      : 'Ok',
                    cancel  : 'Annuleer'
                },

                'Gnt.field.Assignment' : {
                    cancelText : 'Annuleer',
                    closeText  : 'Opslaan en sluiten'
                },

                'Gnt.column.AssignmentUnits' : {
                    text : 'Eenheden'
                },

                'Gnt.column.Duration' : {
                    text : 'Duur'
                },

                'Gnt.column.Effort' : {
                    text : 'Inspanning'
                },

                'Gnt.column.EndDate' : {
                    text : 'Einde'
                },

                'Gnt.column.PercentDone' : {
                    text : '% Gedaan'
                },

                'Gnt.column.ResourceAssignment' : {
                    text : 'Toegewezen Resources'
                },

                'Gnt.column.ResourceName' : {
                    text : 'Resource Naam'
                },

                'Gnt.column.Rollup' : {
                    text : 'Samenvouwen',
                    no   : 'Nee',
                    yes  : 'Ja'
                },

                'Gnt.column.SchedulingMode' : {
                    text : 'Mode'
                },

                'Gnt.column.Predecessor' : {
                    text : 'Voorganger'
                },

                'Gnt.column.Successor' : {
                    text : 'Opvolger'
                },

                'Gnt.column.StartDate' : {
                    text : 'Begin'
                },

                'Gnt.column.WBS' : {
                    text : 'WBS'
                },

                'Gnt.column.Sequence' : {
                    text : '#'
                },

                'Gnt.column.Calendar' : {
                    text : 'Kalender'
                },

                'Gnt.widget.taskeditor.TaskForm' : {
                    taskNameText            : 'Naam',
                    durationText            : 'Duur',
                    datesText               : 'Datums',
                    baselineText            : 'Baseline',
                    startText               : 'Begin',
                    finishText              : 'Einde',
                    percentDoneText         : 'Percentage Compleet',
                    baselineStartText       : 'Begin',
                    baselineFinishText      : 'Einde',
                    baselinePercentDoneText : 'Percentage Compleet',
                    effortText              : 'Inspanning',
                    invalidEffortText       : 'Ongeldige Inspanningswaarde',
                    calendarText            : 'Kalender',
                    schedulingModeText      : 'Scheduling Mode',
                    rollupText              : 'Samenvouwen'
                },

                'Gnt.widget.DependencyGrid' : {
                    idText                      : 'ID',
                    snText                      : 'SN',
                    taskText                    : 'Taak Naam',
                    blankTaskText               : 'Selecteer Taak A.u.b',
                    invalidDependencyText       : 'Ongeldige afhankelijkheid',
                    parentChildDependencyText   : 'Afhankelijkheid tussen ouder en kind gevonden',//?
                    duplicatingDependencyText   : 'Duplicate afhankelijkheid gevonden',
                    transitiveDependencyText    : 'Transitieve afhankelijkheid',
                    cyclicDependencyText        : 'Cyclische afhankelijkheid',
                    typeText                    : 'Type',
                    lagText                     : 'Vertraging',//?
                    clsText                     : 'CSS class',
                    endToStartText              : 'Einde-Tot-Begin',
                    startToStartText            : 'Begin-Tot-Begin',
                    endToEndText                : 'Einde-Tot-Einde',
                    startToEndText              : 'Begin-Tot-Einde'
                },

                'Gnt.widget.AssignmentEditGrid' : {
                    confirmAddResourceTitle : 'Bevestig',
                    confirmAddResourceText  : 'Resource &quot;{0}&quot; niet in de lijst gevonden. Wilt u deze toevoegen?',
                    noValueText             : 'Selecteer een toe te wijzen resource a.u.b.',
                    noResourceText          : 'Geen resource &quot;{0}&quot; gevonden in the lijst'
                },

                'Gnt.widget.taskeditor.TaskEditor' : {
                    generalText         : 'Algemeen',
                    resourcesText       : 'Resources',
                    dependencyText      : 'Voorgangers',
                    addDependencyText   : 'Nieuwe toevoegen',
                    dropDependencyText  : 'Verwijderen',
                    notesText           : 'Notities',
                    advancedText        : 'Geavanceerd',
                    wbsCodeText         : 'WBS code',
                    addAssignmentText   : 'Nieuwe toevoegen',
                    dropAssignmentText  : 'Verwijderen'
                },

                'Gnt.plugin.TaskEditor' : {
                    title           : 'Taak Informatie',
                    alertCaption    : 'Informatie',
                    alertText       : 'Corrigeer gemaakte fouten alvorens op te slaan a.u.b.',
                    okText          : 'Ok',
                    cancelText      : 'Annuleer'
                },

                'Gnt.field.EndDate' : {
                    endBeforeStartText : 'Einddatum ligt voor begindatum'
                },

                'Gnt.column.Note'   : {
                    text            : 'Notitie'
                },

                'Gnt.column.AddNew' : {
                    text            : 'Voeg nieuwe kolom toe...'
                },

                'Gnt.column.EarlyStartDate' : {
                    text            : 'Vroegste startdatum'
                },

                'Gnt.column.EarlyEndDate' : {
                    text            : 'Vroegste einddatum'
                },

                'Gnt.column.LateStartDate' : {
                    text            : 'Late startdatum'
                },

                'Gnt.column.LateEndDate' : {
                    text            : 'Late einddatum'
                },

                'Gnt.field.Calendar' : {
                    calendarNotApplicable : 'Taak kalender heeft geen overlapping met toegewezen resource kalenders'
                },

                'Gnt.column.Slack' : {
                    text            : 'Speling'
                },

                'Gnt.column.Name'   : {
                    text            : 'Taak Naam'
                },

                'Gnt.column.BaselineStartDate'   : {
                    text            : 'Baseline Begindatum'
                },

                'Gnt.column.BaselineEndDate'   : {
                    text            : 'Baseline Einddatum'
                },

                'Gnt.column.Milestone'   : {
                    text            : 'Mijlpaal'
                },

                'Gnt.field.Milestone'   : {
                    yes             : 'Ja',
                    no              : 'Nee'
                },

                'Gnt.field.Dependency'  : {
                    invalidFormatText       : 'Ongeldig formaat van de afhankelijkheid',
                    invalidDependencyText   : 'Ongeldige afhankelijkheid gevonden, zorg ervoor dat u geen cyclische paden heeft tussen uw taken',
                    invalidDependencyType   : 'Ongeldige afhankelijkheid type {0}. Toegestane waarden zijn: {1}.'
                }
            }
        });

        this.callParent(arguments);
    }
});
