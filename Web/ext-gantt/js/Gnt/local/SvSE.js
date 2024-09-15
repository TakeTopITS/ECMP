/*

Ext Gantt 2.2.25
Copyright(c) 2009-2014 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
Ext.define('Gnt.locale.SvSE', {
    extend      : 'Sch.locale.Locale',
    requires    : 'Sch.locale.SvSE',
    singleton   : true,

    constructor : function (config) {

        Ext.apply(this, {
            l10n        : {
                'Gnt.util.DurationParser' : {
                    unitsRegex : {
                        MILLI       : /^ms$|^mil/i,
                        SECOND      : /^s$|^sek/i,
                        MINUTE      : /^m$|^min/i,
                        HOUR        : /^t$|^tim/i,
                        DAY         : /^d$|^dag/i,
                        WEEK        : /^v$|^ve|^vecka/i,
                        MONTH       : /^må|^mån/i,
                        QUARTER     : /^kv$|^kva/i,
                        YEAR        : /^år/i
                    }
                },

                'Gnt.util.DependencyParser' : {
                    typeText    : {
                        SS  : 'SS',
                        SF  : 'SA',
                        FS  : 'AS',
                        FF  : 'AA'
                    }
                },

                'Gnt.field.Duration' : {
                    invalidText : 'Ogiltig varaktighet'
                },

                'Gnt.field.Effort' : {
                    invalidText : 'Ogiltigt värde'
                },

                'Gnt.field.Percent' : {
                    invalidText : 'Ogiltigt procent'
                },

                'Gnt.feature.DependencyDragDrop' : {
                    fromText    : 'Från',
                    toText      : 'Till',
                    startText   : 'Start',
                    endText     : 'Slut'
                },

                'Gnt.Tooltip' : {
                    startText       : 'Börjar: ',
                    endText         : 'Slutar: ',
                    durationText    : 'Längd:'
                },

                'Gnt.plugin.TaskContextMenu' : {
                    taskInformation     : 'Information...',
                    newTaskText         : 'Ny uppgift',
                    deleteTask          : 'Ta bort uppgift(er)',
                    editLeftLabel       : 'Ändra vänster text',
                    editRightLabel      : 'Ändra höger text',
                    add                 : 'Lägg till...',
                    deleteDependency    : 'Ta bort koppling...',
                    addTaskAbove        : 'Uppgift ovanför',
                    addTaskBelow        : 'Uppgift nedanför',
                    addMilestone        : 'Milstolpe',
                    addSubtask          : 'Underuppgift',
                    addSuccessor        : 'Efterföljare',
                    addPredecessor      : 'Föregångare',
                    convertToMilestone  : 'Konvertera till milstolpe',
                    convertToRegular    : 'Konvertera till vanlig uppgift'
                },

                'Gnt.plugin.DependencyEditor' : {
                    fromText            : 'Från',
                    toText              : 'Till',
                    typeText            : 'Typ',
                    lagText             : 'Fördröjning',
                    endToStartText      : 'Slut-Till-Start',
                    startToStartText    : 'Start-Till-Start',
                    endToEndText        : 'Slut-Till-Slut',
                    startToEndText      : 'Start-Till-Slut'
                },

                'Gnt.widget.calendar.Calendar' : {
                    dayOverrideNameHeaderText : 'Namn',
                    overrideName        : 'Namn',
                    startDate           : 'Startdatum',
                    endDate             : 'Slutdatum',
                    error               : 'Fel',
                    dateText            : 'Datum',
                    addText             : 'Lägg till',
                    editText            : 'Ändra',
                    removeText          : 'Ta bort',
                    workingDayText      : 'Arbetstid',
                    weekendsText        : 'Ej arbetstid',
                    overriddenDayText   : 'Undantagsdag',
                    overriddenWeekText  : 'Icke-standard arbetsvecka',
                    workingTimeText     : 'Arbetstid',
                    nonworkingTimeText  : 'Ledig tid',
                    dayOverridesText    : 'Undantag - dag',
                    weekOverridesText   : 'Undantag - vecka',
                    okText              : 'OK',
                    cancelText          : 'Avbryt',
                    parentCalendarText  : 'Baskalender',
                    noParentText        : 'Ingen baskalender',
                    selectParentText    : 'Välj baskalender',
                    newDayName          : '[Inget namn]',
                    calendarNameText    : 'Kalendernamn',
                    tplTexts            : {
                        tplWorkingHours : 'Arbetstimmar för',
                        tplIsNonWorking : 'ej arbetstid',
                        tplOverride     : 'undantag',
                        tplInCalendar   : 'i kalender',
                        tplDayInCalendar: 'vanlig dag i kalender',
                        tplBasedOn      : 'Baserat på'
                    },
                    overrideErrorText   : 'Det finns redan ett undantag för denna dagen',
                    overrideDateError   : 'Det finns redan en undantagsvecka på det här datumet: {0}',
                    startAfterEndError  : 'Startdatum måste vara tidigare än slutdatum',
                    weeksIntersectError : 'Undantagsveckor får inte överlappa'
                },

                'Gnt.widget.calendar.AvailabilityGrid' : {
                    startText           : 'Start',
                    endText             : 'Slut',
                    addText             : 'Lägg till',
                    removeText          : 'Ta bort',
                    error               : 'Fel'
                },

                'Gnt.widget.calendar.DayEditor' : {
                    workingTimeText     : 'Arbetstid',
                    nonworkingTimeText  : 'Ej arbetstid'
                },

                'Gnt.widget.calendar.WeekEditor' : {
                    defaultTimeText    : 'Vanlig tid',
                    workingTimeText    : 'Arbetstid',
                    nonworkingTimeText : 'Ej arbetstid',
                    error              : 'Fel',
                    noOverrideError    : "Undantagsveckan innehåller bara 'vanliga' dagar - kan inte sparas"
                },

                'Gnt.widget.calendar.ResourceCalendarGrid' : {
                    name        : 'Namn',
                    calendar    : 'Kalender'
                },

                'Gnt.widget.calendar.CalendarWindow' : {
                    ok      : 'Ok',
                    cancel  : 'Avbryt'
                },

                'Gnt.field.Assignment' : {
                    cancelText : 'Avbryt',
                    closeText  : 'Spara och stäng'
                },

                'Gnt.column.AssignmentUnits' : {
                    text : 'Enheter'
                },

                'Gnt.column.Duration' : {
                    text : 'Varaktighet'
                },

                'Gnt.column.Effort' : {
                    text : 'Arbetsinsats'
                },

                'Gnt.column.EndDate' : {
                    text : 'Slut'
                },

                'Gnt.column.PercentDone' : {
                    text : '% Färdig'
                },

                'Gnt.column.ResourceAssignment' : {
                    text : 'Tilldelade Resurser'
                },

                'Gnt.column.ResourceName' : {
                    text : 'Resursnamn'
                },

                'Gnt.column.Rollup' : {
                    text : 'Upplyft',
                    yes  : 'Ja',
                    no   : 'Nej'
                },

                'Gnt.column.SchedulingMode' : {
                    text : 'Läge'
                },

                'Gnt.column.Predecessor' : {
                    text : 'Föregående'
                },

                'Gnt.column.Successor' : {
                    text : 'Efterföljande'
                },

                'Gnt.column.StartDate' : {
                    text : 'Start'
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
                    taskNameText            : 'Namn',
                    durationText            : 'Varaktighet',
                    datesText               : 'Datum',
                    baselineText            : 'Originalplan',
                    startText               : 'Start',
                    finishText              : 'Slut',
                    percentDoneText         : 'Procent avklarad',
                    baselineStartText       : 'Start',
                    baselineFinishText      : 'Slut',
                    baselinePercentDoneText : 'Procent avklarad',
                    effortText              : 'Arbetsinsats',
                    invalidEffortText       : 'Ogiltigt värde',
                    calendarText            : 'Kalendar',
                    schedulingModeText      : 'Aktivitetstyp',
                    rollupText              : 'Upplyft'
                },

                'Gnt.widget.DependencyGrid' : {
                    idText                      : 'ID',
                    snText                      : 'SN',
                    taskText                    : 'Name',
                    blankTaskText               : 'Välj en uppgift',
                    invalidDependencyText       : 'Ogiltigt beroende',
                    parentChildDependencyText   : 'Beroende upptäckt mellan en aktivitet och dess sammanfattningsaktivitet',
                    duplicatingDependencyText   : 'Dubblett-beroende upptäckt',
                    transitiveDependencyText    : 'Transitivt beroende',
                    cyclicDependencyText        : 'Cirkulärt beroende',
                    typeText                    : 'Typ',
                    lagText                     : 'Fördröjning',
                    clsText                     : 'CSS klass',
                    endToStartText              : 'Slut-Till-Start',
                    startToStartText            : 'Start-Till-Start',
                    endToEndText                : 'Slut-Till-Slut',
                    startToEndText              : 'Start-Till-Slut'
                },

                'Gnt.widget.AssignmentEditGrid' : {
                    confirmAddResourceTitle : 'Bekräfta',
                    confirmAddResourceText  : 'Resursen &quot;{0}&quot; finns ej tillagd i listan än. Vill du skapa resursen?',
                    noValueText             : 'Välj en resurs att tilldela',
                    noResourceText          : 'Resurs &quot;{0}&quot; finns inte i listan'
                },

                'Gnt.widget.taskeditor.TaskEditor' : {
                    generalText         : 'Information',
                    resourcesText       : 'Resurser',
                    dependencyText      : 'Föregångare',
                    addDependencyText   : 'Lägg till',
                    dropDependencyText  : 'Ta bort',
                    notesText           : 'Anteckningar',
                    advancedText        : 'Avancerat',
                    wbsCodeText         : 'WBS-kod',
                    addAssignmentText   : 'Lägg till',
                    dropAssignmentText  : 'Ta bort'
                },

                'Gnt.plugin.TaskEditor' : {
                    title           : 'Information',
                    alertCaption    : 'Meddelande',
                    alertText       : 'Rätta till felen för att kunna spara ändringarna',
                    okText          : 'Ok',
                    cancelText      : 'Avbryt'
                },

                'Gnt.field.EndDate' : {
                    endBeforeStartText : 'Slutdatum är före startdatum'
                },

                'Gnt.column.Note'   : {
                    text            : 'Anteckning'
                },

                'Gnt.column.AddNew' : {
                    text            : 'Lägg till ny kolumn...'
                },

                'Gnt.column.EarlyStartDate' : {
                    text            : 'Tidig Start'
                },

                'Gnt.column.EarlyEndDate' : {
                    text            : 'Tidigt Slut'
                },

                'Gnt.column.LateStartDate' : {
                    text            : 'Sen Start'
                },

                'Gnt.column.LateEndDate' : {
                    text            : 'Sent Slut'
                },

                'Gnt.field.Calendar' : {
                    calendarNotApplicable : 'Aktivitetskalendern överlappar inte med dess tilldelade resursers kalendrar'
                },

                'Gnt.column.Slack' : {
                    text            : 'Slack'
                },

                'Gnt.column.Name'   : {
                    text            : 'Aktivitet'
                },

                'Gnt.column.BaselineStartDate'   : {
                    text            : 'Originalplan Start'
                },

                'Gnt.column.BaselineEndDate'   : {
                    text            : 'Originalplan Slut'
                },

                'Gnt.column.Milestone'   : {
                    text            : 'Milstolpe'
                },

                'Gnt.field.Milestone'   : {
                    yes             : 'Ja',
                    no              : 'Nej'
                },

                'Gnt.field.Dependency'  : {
                    invalidFormatText       : 'Felaktigt format för koppling',
                    invalidDependencyText   : 'Felaktig koppling upptäckt, vänligen verifiera att du inte har några cykliska beroenden mellan dina uppgifter',
                    invalidDependencyType   : 'Ogiltid kopplingstyp {0}. Tillåtna typer är: {1}.'
                }
            }
        });

        this.callParent(arguments);
    }
});
