/*

Ext Gantt 2.2.25
Copyright(c) 2009-2014 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
Ext.define('Gnt.locale.Pl', {
    extend      : 'Sch.locale.Locale',
    requires    : 'Sch.locale.Pl',
    singleton   : true,

    constructor : function (config) {

        Ext.apply(this, {
            l10n        : {
                'Gnt.util.DurationParser' : {
                    unitsRegex : {
                        MILLI       : /^ms$|^mil/i,
                        SECOND      : /^s$|^sek/i,
                        MINUTE      : /^min/i,
                        HOUR        : /^g$|^godzin/i,
                        DAY         : /^d$|^dni|^dzie/i,
                        WEEK        : /^t$|^tydzie|^tygodni/i,
                        MONTH       : /^m$|^miesi/i,
                        QUARTER     : /^kw$|^kwarta/i,
                        YEAR        : /^r$|^rok$|^lat/i
                    }
                },

                'Gnt.util.DependencyParser' : {
                    typeText    : {
                        SS  : 'RR',
                        SF  : 'RZ',
                        FS  : 'ZR',
                        FF  : 'ZZ'
                    }
                },

                'Gnt.field.Duration' : {
                    invalidText : "Nieprawidłowa wartość czasu"
                },

                'Gnt.field.Effort' : {
                    invalidText : 'Niepoprawna wartość pracy'
                },

                'Gnt.field.Percent' : {
                    invalidText : 'Niepoprawna wartość procentowa'
                },

                'Gnt.feature.DependencyDragDrop' : {
                    fromText    : 'Od',
                    toText      : 'Do',
                    startText   : 'Początek',
                    endText     : 'Koniec'
                },

                'Gnt.Tooltip' : {
                    startText       : 'Rozpoczyna się: ',
                    endText         : 'Kończy: ',
                    durationText    : 'Trwa: '
                },

                'Gnt.plugin.TaskContextMenu' : {
                    taskInformation     : 'Informacje o zadaniu...',
                    newTaskText         : 'Nowe zadanie',
                    deleteTask          : 'Usuń zadanie(a)',
                    editLeftLabel       : 'Edytuj lewą etykietę',
                    editRightLabel      : 'Edytuj prawą etykietę',
                    add                 : 'Dodaj...',
                    deleteDependency    : 'Usuń zależność...',
                    addTaskAbove        : 'Zadanie wyżej',
                    addTaskBelow        : 'Zadanie poniżej',
                    addMilestone        : 'Kamień milowy',
                    addSubtask          : 'Pod-zadanie',
                    addSuccessor        : 'Następce',
                    addPredecessor      : 'Poprzednika',
                    convertToMilestone  : 'Konwertuj na kamień milowy',
                    convertToRegular    : 'Konwertuj na normalne zadanie'
                },

                'Gnt.plugin.DependencyEditor' : {
                    fromText            : 'Od',
                    toText              : 'Do',
                    typeText            : 'Typ',
                    lagText             : 'Opóźnienie',
                    endToStartText      : 'Koniec-Do-Początku',
                    startToStartText    : 'Początek-Do-Początku',
                    endToEndText        : 'Koniec-Do-Końca',
                    startToEndText      : 'Początek-Do-Końca'
                },

                'Gnt.widget.calendar.Calendar' : {
                    dayOverrideNameHeaderText : 'Nazwa',
                    overrideName        : 'Nazwa',
                    startDate           : 'Początek',
                    endDate             : 'Koniec',
                    error               : 'Błąd',
                    dateText            : 'Data',
                    addText             : 'Dodaj',
                    editText            : 'Edytuj',
                    removeText          : 'Usuń',
                    workingDayText      : 'Dzień pracujący',
                    weekendsText        : 'Weekend',
                    overriddenDayText   : 'Nadpisany dzień',
                    overriddenWeekText  : 'Nadpisany tydzień',
                    workingTimeText     : 'Czas pracy',
                    nonworkingTimeText  : 'Czas niepracujący',
                    dayOverridesText    : 'Nadpisane dni',
                    weekOverridesText   : 'Nadpisane tygodnie',
                    okText              : 'OK',
                    cancelText          : 'Anuluj',
                    parentCalendarText  : 'Kalendarz-rodzic',
                    noParentText        : 'Brak rodzica',
                    selectParentText    : 'Wybierz rodzica',
                    newDayName          : '[Bez nazwy]',
                    calendarNameText    : 'Nazwa kalendarza',
                    tplTexts            : {
                        tplWorkingHours : 'Godziny pracujące dla',
                        tplIsNonWorking : 'jest niepracujący',
                        tplOverride     : 'nadpisane',
                        tplInCalendar   : 'w kalendarzu',
                        tplDayInCalendar: 'normalny dzień w kalendarzu',
                        tplBasedOn      : 'W oparciu'
                    },
                    overrideErrorText   : 'Ten dzień został juz nadpisany',
                    overrideDateError   : 'Istnieje już nadpisany tydzień dla tej daty: {0}',
                    startAfterEndError  : 'Data początku musi być wcześniejsza od daty końca',
                    weeksIntersectError : 'Nadpisania tygodnia nie powinny się nakładać'
                },

                'Gnt.widget.calendar.AvailabilityGrid' : {
                    startText          : 'Początek',
                    endText            : 'Koniec',
                    addText            : 'Dodaj',
                    removeText         : 'Usuń',
                    error              : 'Błąd'
                },

                'Gnt.widget.calendar.DayEditor' : {
                    workingTimeText    : 'Czas pracujący',
                    nonworkingTimeText : 'Czas niepracujący'
                },

                'Gnt.widget.calendar.WeekEditor' : {
                    defaultTimeText    : 'Domyślny czas',
                    workingTimeText    : 'Czas pracujący',
                    nonworkingTimeText : 'Czas niepracujący',
                    error              : 'Błąd',
                    noOverrideError    : "Nadpisania tygodnia zawierają tylko 'domyślne' dni - nie można zapisać"
                },

                'Gnt.widget.calendar.ResourceCalendarGrid' : {
                    name        : 'Nazwa',
                    calendar    : 'Kalendarz'
                },

                'Gnt.widget.calendar.CalendarWindow' : {
                    ok      : 'Ok',
                    cancel  : 'Anuluj'
                },

                'Gnt.field.Assignment' : {
                    cancelText : 'Anuluj',
                    closeText  : 'Zapisz i zamknij'
                },

                'Gnt.column.AssignmentUnits' : {
                    text : 'Jednostki'
                },

                'Gnt.column.Duration' : {
                    text : 'Czas trwania'
                },

                'Gnt.column.Effort' : {
                    text : 'Praca'
                },

                'Gnt.column.EndDate' : {
                    text : 'Koniec'
                },

                'Gnt.column.PercentDone' : {
                    text : '% Wykonania'
                },

                'Gnt.column.ResourceAssignment' : {
                    text : 'Przypisane zasoby'
                },

                'Gnt.column.ResourceName' : {
                    text : 'Nazwa zasobu'
                },

                'Gnt.column.Rollup' : {
                    text : 'Rzutowanie',
                    yes  : 'Tak',
                    no   : 'Nie'
                },

                'Gnt.column.SchedulingMode' : {
                    text : 'Tryb'
                },

                'Gnt.column.Predecessor' : {
                    text : 'Poprzednicy'
                },

                'Gnt.column.Successor' : {
                    text : 'Następcy'
                },

                'Gnt.column.StartDate' : {
                    text : 'Początek'
                },

                'Gnt.column.WBS' : {
                    text : '#'
                },

                'Gnt.column.Sequence' : {
                    text : '#'
                },

                'Gnt.column.Calendar' : {
                    text : 'Kalendarz'
                },

                'Gnt.widget.taskeditor.TaskForm' : {
                    taskNameText            : 'Nazwa',
                    durationText            : 'Długość',
                    datesText               : 'Daty',
                    baselineText            : 'Baseline',
                    startText               : 'Początek',
                    finishText              : 'Koniec',
                    percentDoneText         : '% Wykonano',
                    baselineStartText       : 'Początek',
                    baselineFinishText      : 'Koniec',
                    baselinePercentDoneText : '% Wykonano',
                    effortText              : 'Praca',
                    invalidEffortText       : 'Niepoprawna wartość pracy',
                    calendarText            : 'Kalendarz',
                    schedulingModeText      : 'Tryb kalendarza',
                    rollupText              : 'Rzutowanie'
                },

                'Gnt.widget.DependencyGrid' : {
                    idText                      : 'ID',
                    snText                      : 'SN',
                    taskText                    : 'Nazwa zadania',
                    blankTaskText               : 'Proszę wybrać zadanie',
                    invalidDependencyText       : 'Nieprawidłowa zależność',
                    parentChildDependencyText   : 'Zależność pomiędzy dzieckiem a rodzicem znaleziona',
                    duplicatingDependencyText   : 'Zduplikowana zależność znaleziona',
                    transitiveDependencyText    : 'Przechodnia zależność',
                    cyclicDependencyText        : 'Cykliczna zależność',
                    typeText                    : 'Typ',
                    lagText                     : 'Opóźnienie',
                    clsText                     : 'Klasa CSS',
                    endToStartText              : 'Koniec-Do-Początku',
                    startToStartText            : 'Początek-Do-Początku',
                    endToEndText                : 'Koniec-Do-Końca',
                    startToEndText              : 'Początek-Do-Końca'
                },

                'Gnt.widget.AssignmentEditGrid' : {
                    confirmAddResourceTitle : 'Potwierdz',
                    confirmAddResourceText  : 'NIe ma jeszcze zasobu &quot;{0}&quot; . Czy chcesz go dodać?',
                    noValueText             : 'Proszę wybrać zasób do przypisania',
                    noResourceText          : 'Brak zasobu &quot;{0}&quot;'
                },

                'Gnt.widget.taskeditor.TaskEditor' : {
                    generalText         : 'Ogólne',
                    resourcesText       : 'Zasoby',
                    dependencyText      : 'Poprzednicy',
                    addDependencyText   : 'Dodaj',
                    dropDependencyText  : 'Usuń',
                    notesText           : 'Notatki',
                    advancedText        : 'Zaawansowane',
                    wbsCodeText         : 'Kod WBS',
                    addAssignmentText   : 'Dodaj',
                    dropAssignmentText  : 'Usuń'
                },

                'Gnt.plugin.TaskEditor' : {
                    title           : 'Informacje o zadaniu',
                    alertCaption    : 'Informacje',
                    alertText       : 'Proszę poprawić zaznaczone błędy aby zapisać zmiany',
                    okText          : 'Ok',
                    cancelText      : 'Anuluj'
                },

                'Gnt.field.EndDate' : {
                    endBeforeStartText : 'Data końca jest przed datą początku'
                },

                'Gnt.column.Note'   : {
                    text            : 'Notatki'
                },

                'Gnt.column.AddNew' : {
                    text            : 'Dodaj kolumnę...'
                },

                'Gnt.column.EarlyStartDate' : {
                    text            : 'Wczesny Start'
                },

                'Gnt.column.EarlyEndDate' : {
                    text            : 'Wczesny Koniec'
                },

                'Gnt.column.LateStartDate' : {
                    text            : 'Późny Start'
                },

                'Gnt.column.LateEndDate' : {
                    text            : 'Późny Finish'
                },

                'Gnt.field.Calendar' : {
                    calendarNotApplicable : 'Kalendarz zadań nie nakłada się z przypisanymi kalendarzami zasobów'
                },

                'Gnt.column.Slack' : {
                    text            : 'Wolne'
                },

                'Gnt.column.Name' : {
                    text            : 'Nazwa zadanie'
                },

                'Gnt.column.BaselineStartDate'   : {
                    text            : 'Data rozpoczęcia lini bazowej'
                },

                'Gnt.column.BaselineEndDate'   : {
                    text            : 'Data zakończenia lini bazowej'
                },

                'Gnt.column.Milestone'   : {
                    text            : 'Kamień milowy'
                },

                'Gnt.field.Milestone'   : {
                    yes             : 'Tak',
                    no              : 'Nie'
                },

                'Gnt.field.Dependency'  : {
                    invalidFormatText       : 'Invalid dependency format',
                    invalidDependencyText   : 'Invalid dependency found, please make sure you have no cyclic paths between your tasks and this type of dependency is allowed',
                    invalidDependencyType   : 'Invalid dependency type {0}. Allowed values are: {1}.'
                }
            }
        });

        this.callParent(arguments);
    }
});
