<form action="./AddClientServlet" method="post">
<div id="add_clients" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Client</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input name="FirstName" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name</label>
                                <input name="LastName" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                <input name="Username" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                <input name="Email" required class="form-control floating" type="email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Password</label>
                                <input name="Password" required class="form-control" type="password">
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Client ID <span class="text-danger">*</span></label>
                                <input name="ClientID" class="form-control floating" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Phone </label>
                                <input name="Phone" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Company Name</label>
                                <input name="Company" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Address</label>
                                <input class="form-control" name="Address" required type="text">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="custom-file">
                                <label for="">Client Picture</label>
                                <input name="Picture" type="file" class="custom-file-input" id="validatedCustomFile" required="">
                                <label class="custom-file-label" for="validatedCustomFile" >Choose Profile Picture...</label>
                                <div class="invalid-feedback">Example invalid custom file feedback</div>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" name="add_client" class="btn btn-primary submit-btn">Submit</button>
                    </div>
            </div>
        </div>
    </div>
</div>
</form>