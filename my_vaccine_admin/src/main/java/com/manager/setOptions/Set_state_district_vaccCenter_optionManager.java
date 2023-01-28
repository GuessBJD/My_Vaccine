package com.manager.setOptions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.dao.Vacc_centerDao;


@WebServlet("/setOptions")
public class Set_state_district_vaccCenter_optionManager extends HttpServlet{
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            //CountryStateDao csd = new CountryStateDao(DBCon.getCon());
            
            String op = request.getParameter("operation");
            
            if (op.equals("state")) {
                List<String> states = com.dao.Vacc_centerDao.getAllStates();
                Gson json = new Gson();
                String stateList = json.toJson(states);
                response.setContentType("text/html");
                response.getWriter().write(stateList);
            }

            if (op.equals("district")) {
                String state = request.getParameter("state");
                List<String> districts = com.dao.Vacc_centerDao.getDistrictByState(state);
                Gson json = new Gson();
                String districtList = json.toJson(districts);
                response.setContentType("text/html");
                response.getWriter().write(districtList);
            }

            if (op.equals("vacc_center")) {            	
                String district = request.getParameter("district");
                List<String> citylist = com.dao.Vacc_centerDao.getVaccCenterByDistrict(district);
                Gson json = new Gson();
                String vaccCenterList = json.toJson(citylist);
                response.setContentType("text/html");
                response.getWriter().write(vaccCenterList);
            }
        }
    }
	
}
