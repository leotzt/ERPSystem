package com.neusoft.web.impl;

public class EA15DeleteServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete","ɾ��");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
