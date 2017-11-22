SELECT   A.WOID AS ID, A.PARENTWOID AS ParentID, A.RESPONSEDATE AS RespondBy,
				  A.TASK AS Summary, A.TYPE AS Type, A.REQUEST AS Requestor,
				  A.REQDATE AS RequestedDate, A.CLSDDATE AS ResolutionDate,
				  A.ELAPSETIME AS ElapsedType, A.PRIORITY AS Priority,
				  A.DUEDATE AS DueDate, A.RESPONS AS AssignedTechnician, A.COMPLETED AS DateCompleted, A.HOURS AS Hours,
				  A.DEPT AS Department, A.DESCRIPT AS Notes, A.NOTE AS Resolution,
				  Status.WorkOrderStatusName AS CurrentStatus,
				  A.LOOKUP1 AS IncidentOrServiceReq, A.LOOKUP2 AS HotList,
				  A.RESPONDEDDATE AS DateResponded, Type.WorkOrderTypeName,
				  A.WOTYPE2 AS Subtype,
				  A.WO_TEXT1 AS Text1,
				  A.WO_TEXT4 AS Text4,
				  A.TaskLookup3 AS ForwardProject, A.TaskLookup4 AS OrgImpact,
				  A.TaskLookup5 AS RequestorPriority, A.TaskLookup6, A.TaskLookup7,
				  A.TaskLookup8 AS ITInvolvement,
				  A.ASSNDATE, A.WOTYPE3, A.STATUS, 
				  A.WO_TEXT2, A.WO_TEXT3, A.WO_TEXT5, A.WO_TEXT6,
				  A.WO_NUM1, A.WO_NUM1, A.WO_INT1
FROM [TRACKIT_DATA_PROD].[dbo].[TASKS] AS A
LEFT JOIN WorkOrderStatus AS Status ON A.WorkOrderStatusId = Status.WorkOrderStatusId
left join WorkOrderType AS Type ON A.WorkOrderTypeId = Type.WorkOrderTypeId
order by A.ASSNDATE Desc

  -- select COUNT(WOID) FROM TASKS
