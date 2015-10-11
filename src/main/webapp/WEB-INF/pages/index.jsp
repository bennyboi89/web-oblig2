<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 07.10.15
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <c:set var="root" value="${pageContext.request.contextPath}"/>
  <!DOCTYPE html>

  <html>
    <head>
      <title>GjøreMål</title>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

      <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- Optional theme -->
      <link rel="stylesheet" href="<c:url value="resources/css/main.css" />">

      <script src="<c:url value="resources/javascript/mask.js"/>"></script>

      <script src="<c:url value="resources/javascript/main.js"/>"></script>

  </head>
  <body>


  <h1 style="margin-left:400px;">Gjøremål</h1>
  <hr>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="row-xs-8">
          <div class="main-box no-header clearfix">
            <div class="main-box-body clearfix">
              <div class="table-responsive">
                <table class="table user-list striped">
                  <thead>
                  <tr>
                    <th><span>Navn</span></th>
                    <th><span>Beskrivelse</span></th>

                    <th>&nbsp;</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="vare" items="${vareList}">
                    <tr>
                      <td>
                        <i class="fa fa-user"></i>
                        <span class="label label-default">${vare.navn}</span>
                      </td>

                      <td>
                        <span class="label label-default">${vare.beskrivelse}</span>
                      </td>

                      <td style="width: 20%;">

                        <a id="${vare.id}" class="table-link edit"  data-toggle="modal" data-target="#basicModalEdit">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                            </span>
                        </a>
                        <a id="${vare.id}" class="table-link danger delete" data-toggle="modal" data-target="#confirm-delete">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                            </span>
                        </a>

                      </td>
                    </tr>

                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="row-xs-4">

          <a href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal" style="float:right">
            <i class="fa fa-plus"></i> Legge til ny vare
          </a>

        </div>
      </div>
    </div>
  </div>



  <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h4 class="modal-title" id="myModalLabel"><i class="fa fa-user"></i>  Legge til ny vare</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" role="form" name="frm" id="frm" method="POST">
            <div class="form-group">
              <label class="control-label col-sm-3" for="navn">Navn(*):</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="navn" name="navn" placeholder="Skriv inn navn" required>
                <label id="stateNavn" class="label label-danger"></label>
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-sm-3" for="beskrivelse">Beskrivelse(*):</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="beskrivelse" name="beskrivelse" placeholder="Beskrivelse" required>
                <label id="stateBeskrivelse" class="label label-danger"></label>
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-sm-3" for="beskrivelse"></label>
              <div class="col-sm-9">
                <label id="stateCaptcha" class="label label-danger"></label>
              </div>
            </div>

            <div id="addResult"></div>

          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Avbryt</button>
          <button id="save" name="save" type="button" class="btn btn-primary">Lagre </button>
        </div>
      </div>
    </div>
  </div>

  <!-- edit -->

  <div class="modal fade" id="basicModalEdit" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h4 class="modal-title" id="myModalLabel"><i class="fa fa-cog"></i>  Endre Vare</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" role="form" name="frm" id="frm" method="POST">

            <div id="editVare">

              <div class="form-group">
                <label class="control-label col-sm-3" for="navn">Navn(*):</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="navn" name="navn" value="${var.navn}" required>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-3" for="beskrivelse">Beskrivelse(*):</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="beskrivelse" name="beskrivelse" placeholder="Skriv inn beskrivelse" required>
                </div>
              </div>


            </div>

          </form>

          <div id="updateResult"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Avbryt</button>
          <button id="update" name="update" type="button" class="btn btn-primary">Oppdater </button>
        </div>
      </div>
    </div>
  </div>

  <!-- Delete Modal -->

  <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myModalLabel">Er du sikker?</h4>
        </div>

        <div class="modal-body">
          <p>Du er i ferd med å slette denne varen.</p>
          <p>Vil du fortsette?</p>

          <span id="deleteResult" style="margin-left:250px"></span>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Avbryt</button>
          <a class="btn btn-danger btn-ok" id="delete">Slette</a>
        </div>
      </div>
    </div>
  </div>


  </body>
  </html>