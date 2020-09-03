$(document).ready(function() {
    //alert("called");
    $('#fieldContainerForm').bootstrapValidator({
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
                        message: 'The email is required'
                    }
                }
            },
            'user[password]': {
                //container: '#user[password]Message',
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            'user[password_confirmation]': {
                //container: '#user[password_confirmation]Message',
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            'post[content]': {
                //container: '#user[password_confirmation]Message',
                validators: {
                    notEmpty: {
                        message: 'The content is required'
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
                        message: 'The image is required and cannot be empty'
                    }
                }
            }
        }
    });
});
