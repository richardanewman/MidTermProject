<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${! empty org}">
			<h1>Found it!</h1>
${org.orgName}<br>
			<br>
${org.location.address}<br>
			<br>
${org.location.city}<br>
			<br>
${org.location.state}<br>
			<br>
${org.orgType}<br>
			<br>
${org.orgNum}<br>
			<br>
${org.logoURL}<br>
			<br>
${org.website}<br>
			<br>
		</c:if>
		<br>
<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
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
                  Display All Activity
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="getNewTxForm.do">
                  <span data-feather="plus-square"></span>
                  Add New Transaction
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#modify">
                  <span data-feather="edit-2"></span>
                  Modify Transaction
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#recent-activity">
                  <span data-feather="database"></span>
                  Recent Activity
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Reports
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Saved reports</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Current month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">Ledger Dashboard</h4>    
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
<div class="card-deck">
  <div class="card" style="height: 5%;">
    <div class="card-body">
    <p class="current" ><strong><fmt:formatNumber type="currency" value="${current.balance}"/></strong></p>
      <h5 class="card-title current-sub">Current Balance</h5>
    </div>
  </div>
  <div class="card" style="height: 5%;">
    <div class="card-body">
    <p class="current-2" ><strong><fmt:formatNumber type="currency" value="${average}"/></strong></p>
      <h5 class="card-title current-sub">Average Purchase</h5>
    </div>
  </div>
  <div class="card" style="height: 5%;">
    <div class="card-body">
    <p class="current-3" ><strong><fmt:formatNumber type="currency" value="${max}"/></strong></p>
      <h5 class="card-title current-sub">Most Expensive Purchase</h5>
    </div>
  </div>
</div>
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