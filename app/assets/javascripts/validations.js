$(document).ready(function() {
    //alert("called");
    $('#fieldContainerForm,#field-container-form').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'user[email]': {
                //container: '#user[email]Message',
                validators: {
                    notEmpty: {
                        message: 'Email is required'
                    }
                }
            },
            'user[password]': {
                //container: '#user[password]Message',
                validators: {
                    notEmpty: {
                        message: 'Password is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'Password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            'user[password_confirmation]': {
                //container: '#user[password_confirmation]Message',
                validators: {
                    notEmpty: {
                        message: 'Password is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'Password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            'post[content]': {
                //container: '#user[password_confirmation]Message',
                validators: {
                    notEmpty: {
                        message: 'Content is required'
                    },
                    stringLength: {
                        min: 1,
                        max: 300,
                        message: 'Max 300 charactors are allowed'
                    }
                }
            },
            'post[image]': {
                //container: '#user[password_confirmation]Message',
                validators: {
                    notEmpty: {
                        message: 'Image is required and cannot be empty'
                    }
                }
            }
        }
    });
});
