package com.index.dao;
import com.notice.dao.*;

public class IndexDao {
	public NoticeDao getNoticeDao()
	{
		NoticeDao n = new NoticeDao();
		return n;
		
	} 
}
