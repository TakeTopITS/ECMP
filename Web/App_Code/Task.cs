using System;

/// <summary>
/// Task 的摘要说明
/// </summary>
public class Task
{
    public Task()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    private int planDays;
    private DateTime planStartDate;
    private DateTime truckStartDate;
    private int truckDates;
    private int trackDays;

    public int PlanDays
    {
        set { planDays = value; }
        get { return planDays; }
    }

    public DateTime PlanStartDate
    {
        set { planStartDate = value; }
        get { return planStartDate; }
    }

    public DateTime TrackStartDate
    {
        set { truckStartDate = value; }
        get { return truckStartDate; }
    }

    public int TruckDates
    {
        set { truckDates = value; }
        get { return truckDates; }
    }

    public int TrackDays
    {
        set { trackDays = value; }
        get { return trackDays; }
    }
}