	-- 검색범위 지정용 날짜생성
	Declare @StartDate varchar(10)
	Declare @EndDate varchar(10)
	Select @StartDate = convert(varchar(10),DateAdd(day, 0, DateAdd(month, @Month - 1, DateAdd(Year, @Year-1900, 0))),120)
		, @EndDate = convert(varchar(10),DateAdd(day, -1, DateAdd(month, @Month , DateAdd(Year, @Year-1900, 0))),120)
	--select @StartDate, @EndDate 

	-- 날짜로 검색문자열 생성(피봇테이블용 필드셋)
	DECLARE @StatDates varchar(2000)
	SET @StatDates = ''  
	SELECT @StatDates = @StatDates + '[' + STAT_DATE + '],'  
		FROM (SELECT Distinct STAT_DATE FROM STAT_TABLE WHERE STAT_DATE BETWEEN @StartDate AND @EndDate ) A   
	SET @StatDates = LEFT(@StatDates, LEN(@StatDates) - 1)   
	
	-- 다이나믹 피봇테이믈로 실행
	EXEC ('SELECT * FROM STAT_TABLE  
			PIVOT ( 
				SUM(SELLING_COUNT) FOR STAT_DATE IN (' + @StatDates + ')  
			) AS PVT Order by ITEM_ID ASC')   