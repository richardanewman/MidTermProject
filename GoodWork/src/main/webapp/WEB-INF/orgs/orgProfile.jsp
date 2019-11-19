<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<%@include file="/WEB-INF/nav.jsp"%>
<title>goodWork Dashboard</title>
</head>
<body>
<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="css/img_avatar.png" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="displayAll.do">
                  <span data-feather="activity"></span>
                  My Events
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="getNewTxForm.do">
                  <span data-feather="plus-square"></span>
                  Create New Event
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#modify">
                  <span data-feather="edit-2"></span>
                  Edit Event
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#recent-activity">
                  <span data-feather="database"></span>
                  Message Board
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Past Events</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Users Attended
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Reviews
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">${orgData.orgName} Dashboard</h4>    
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">Share</button>
                <button class="btn btn-sm btn-outline-secondary">Export</button>
              </div>
              <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
            </div>
          </div>
<!-- Calendar -->
<div class="container-fluid">
  <header>
    <h4 class="display-4 mb-4 text-center">November</h4>
    <div class="row d-none d-sm-flex p-1 bg-dark text-white">
      <h5 class="col-sm p-1 text-center">Sunday</h5>
      <h5 class="col-sm p-1 text-center">Monday</h5>
      <h5 class="col-sm p-1 text-center">Tuesday</h5>
      <h5 class="col-sm p-1 text-center">Wednesday</h5>
      <h5 class="col-sm p-1 text-center">Thursday</h5>
      <h5 class="col-sm p-1 text-center">Friday</h5>
      <h5 class="col-sm p-1 text-center">Saturday</h5>
    </div>
  </header>
  <div class="row border border-right-0 border-bottom-0">
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">29</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">30</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">31</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">1</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">2</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">3</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-info text-white" title="Test Event 1">Test Event 1</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">4</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">5</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">6</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">7</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">8</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-success text-white" title="Test Event 2">Test Event 2</a>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-danger text-white" title="Test Event 3">Test Event 3</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">9</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">10</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">11</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">12</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">13</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">14</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">15</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">16</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">17</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">18</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">19</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">20</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-primary text-white" title="Test Event with Super Duper Really Long Title">Test Event with Super Duper Really Long Title</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">21</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">22</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">23</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">24</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">25</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">26</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">27</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">28</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">29</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">30</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">1</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">2</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">3</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">4</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">5</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">6</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">7</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">8</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">9</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
  </div>
</div>
<!-- End Calendar -->
<div class="current-chart">Most Recent Transactions</div>
<canvas class="my-4" id="myChart" width="900" height="380"></canvas>
<a id="modify"></a>
<div class="card-deck">
  <div class="card">
    <span class="feather-card" data-feather="edit"></span>
    <div class="card-body">
      <h5 class="card-title">Edit Transaction</h5>
      <p class="card-text">Edit any transaction by entering the transaction ID number.</p>
      <form action="updateTxForm.do" method="GET" >
		<input class="form-control" type="number"  min="0" required="required" name="id" placeholder="Enter ID"/> 
  		<input class="btn btn-dark btn-lg btn-block" type="submit" value="Edit Transaction" />
		</form>
    </div>
  </div>
  <div class="card">
     <span class="feather-card" data-feather="hash"></span>
    <div class="card-body">
      <h5 class="card-title">Search By ID Number</h5>
      <p class="card-text">Find any transaction by its ID number.</p>
      <form action="findById.do" method="GET" >
		<input class="form-control" type="number"  min="0" required="required" name="id" placeholder="Enter ID"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Find By ID" />
		</form>
    </div>
  </div>
  <div class="card">
    <span class="feather-card" data-feather="search"></span>
    <div class="card-body">
      <h5 class="card-title">Search By Keyword</h5>
      <p class="card-text">Search transaction descriptions by a single keyword</p>
      <form action="searchKeyword.do" method="GET" >
		<input class="form-control" type="text" required="required" name="keyword" placeholder="Enter Keyword"/> 
  		<input class="btn btn-dark btn-lg btn-block" type="submit" value="Search Keyword" />
		</form>
    </div>
  </div>
  <div class="card">
    <span class="feather-card" data-feather="trash-2"></span>
    <div class="card-body">
      <h5 class="card-title">Delete A Transaction</h5>
      <p class="card-text">Permanently remove any transaction by its ID number.</p>
      <form action="deleteTx.do" method="POST" >
		<input class="form-control" type="number"  min="1" required="required" name="id" placeholder="Enter ID Number"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Delete Transaction" />
		</form>
    </div>
  </div>
</div>

          <h2>Recent Activity</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>ID#</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Amount</th>
                  <th>Balance</th>
                </tr>
              </thead>
              <tbody id="recent-activity">
                <tr>
                  <td>${recent[0].id}</td>
                  <td>${recent[0].txDate}</td>
                  <td>${recent[0].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[0].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[0].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[1].id}</td>
                  <td>${recent[1].txDate}</td>
                  <td>${recent[1].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[1].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[1].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[2].id}</td>
                  <td>${recent[2].txDate}</td>
                  <td>${recent[2].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[2].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[2].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[3].id}</td>
                  <td>${recent[3].txDate}</td>
                  <td>${recent[3].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[3].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[3].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[4].id}</td>
                  <td>${recent[4].txDate}</td>
                  <td>${recent[4].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[4].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[4].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[5].id}</td>
                  <td>${recent[5].txDate}</td>
                  <td>${recent[5].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[5].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[5].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[6].id}</td>
                  <td>${recent[6].txDate}</td>
                  <td>${recent[6].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[6].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[6].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[7].id}</td>
                  <td>${recent[7].txDate}</td>
                  <td>${recent[7].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[7].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[7].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[8].id}</td>
                  <td>${recent[8].txDate}</td>
                  <td>${recent[8].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[8].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[8].balance}"/></td>
                </tr>
                <tr>
                  <td>${recent[9].id}</td>
                  <td>${recent[9].txDate}</td>
                  <td>${recent[9].description}</td>
                  <td><fmt:formatNumber type="currency" value="${recent[9].amount}"/></td>
                  <td><fmt:formatNumber type="currency" value="${recent[9].balance}"/></td>
                </tr>
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

</body>
</html>