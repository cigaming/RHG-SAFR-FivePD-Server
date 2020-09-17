let showCadSystem = function(){
    $('#police-cad').show();
    $('#input-plate').focus();
    isCadSystemShowed = true;
}

let hideCadSystem = function(){
    $('#police-cad').hide();
    isCadSystemShowed = false;
}

document.onkeydown = function (data) {
    if ((data.which == 120 || data.which == 27) && isCadSystemShowed) { // || data.which == 8
        $.post('http://esx_police_cad/escape');
    }
};

$(document).on('click','.civ-back', function (ev) {
    $('.civilian-details .inputfield').empty();
    $('.civilian-details').hide(300);
    $('.resultinner').show(300);
});

$(function() {
    window.addEventListener('message', function(event) {

        if (event.data.civilianresults){
            $('.tbody-result-users').remove();
            $('.all-found-users').append($('<tbody class="tbody-result-users">'));
            event.data.civilianresults.forEach(function(user){
                $('.tbody-result-users').append($('<tr>').on('click', function(){
                    showExtraUserData(user);
                })
                    .append($('<td>').text(user['firstname']))
                    .append($('<td>').text(user['lastname']))
                    .append($('<td>').text(user['sex']))
                    .append($('<td>').text(user['dateofbirth'])));
            })
        }

        if (event.data.crresults){
           createTableCr(event.data.crresults);
        }
        console.log(event.data);
        if (event.data.licenseResults){
            createTableLicense(event.data.licenseResults);
        }

        if (event.data.plate){
            $('#plate').empty().append(event.data.plate);
            $('#model').empty().append(event.data.model);
            $('#firstname').empty().append(event.data.firstname);
            $('#lastname').empty().append(event.data.lastname);
        }

        if(event.data.showCadSystem === true){
            showCadSystem();
        }

        if(event.data.showCadSystem === false){
            hideCadSystem();
        }

    });

    document.onkeydown = function (data) {
        if ((data.which == 13)){
            searchPlate();
        }

        if ((data.which == 120 || data.which == 27) && isCadSystemShowed) { // || data.which == 8
            $.post('http://esx_police_cad/escape');
            hideCadSystem();
        }
    };

    $(document).on('click','#search-for-plate',function(event){
        searchPlate();
    });

    $(document).on('click','.police-cad-close',function(event){
        $.post('http://esx_police_cad/escape');
        hideCadSystem();
    });

    $(document).on('click','.civ-back', function (ev) {
        $('.resultinner').show(300);
    });

    $(document).on('click','.add-cr', function (ev) {
        $('.modal-add-record').show(300);
    });

    $(document).on('click','#save-criminal-record', function (ev) {
        if($('#cr-offence').val().length > 2){
            addCR();
            $('.modal-add-record').hide(400);

            playerid = JSON.stringify({ playerid: $('#cr-playerid').val() });
            $.post('http://esx_police_cad/get-cr', playerid );

        }else{
            $('.error-cr').text('Please fill in the fields');
        }
    });

    $(document).on('click','#search-for-civilian',function(event){
        searchPlayer();
    });

    function searchPlate(){
        plate = JSON.stringify({ plate: $('#input-plate').val() });
        $.post('http://esx_police_cad/search-plate', plate);
    }

    function addCR(){
        criminalRecord = JSON.stringify({ offence: $('#cr-offence').val(), jail: $('#cr-jail').val(), playerid: $('#cr-playerid').val() });
        $.post('http://esx_police_cad/add-cr', criminalRecord);
    }

    $(document).on('click', '.police-cad-menu li', function () {
        var id = $(this).data('id');
        $('.active').removeClass('active');
        $(this).addClass('active');

        hidePlateChecker();

        if($(this).data('id') == 'plate-checker'){
            showPlateChecker();
        }

        $('.page').hide();
        $('#'+id).show();
        $('input').focus();
    });
});

function showPlateChecker(){
    $('#plate-checker').show();
}
function hidePlateChecker(){
    $('#plate-checker').hide();
}

function createTableCr(crresults){
    $('#criminal-records tbody').html('');
    crresults.forEach(function(cr){
        $('#criminal-records tbody').append($('<tr>')
            .append($('<td>').text(cr['offence']))
            .append($('<td>').text(cr['jail'] ? 'true' : 'false'))
            .append($('<td>').text(cr['created_at'])));
    })
}

function createTableLicense(licenseResults){
    licenseResults.forEach(function(license){
        $('#licenses tbody').append($('<tr>')
            .append($('<td>').text(license['type'])));
    })
}

function showExtraUserData(user){
    $('#criminal-records tbody').html('');
    $('#licenses tbody').html('');
    $('.resultinner').hide(300);
    $('.civilian-details').show(300);

    $('#cr-playerid').val(user.identifier);
    $('.firstname-label').text('Firstname');
    $('.firstname').text(user.firstname);

    $('.lastname-label').text('Lastname');
    $('.lastname').text(user.lastname);

    $('.sex-label').text('Sex');
    $('.sex').text(user.sex);

    $('.dob-label').text('Date of birth');
    $('.dob').text(user.dateofbirth);

    $('.height-label').text('Height');
    $('.height').text(user.height);

    $('.phone-label').text('Phone');
    $('.phone').text(user.phone_number);

    $('.job-label').text('Job');
    $('.job').text(user.job);

    $('.jail-label').text('In jail?');
    $('.jail').text((user.jail ? 'Yes': 'No'));

    playerid = JSON.stringify({ playerid: user.identifier });
    $.post('http://esx_police_cad/get-cr', playerid );

    $.post('http://esx_police_cad/get-license', playerid );
}

function searchPlayer(){
    search = JSON.stringify({ search: $('#search').val() });
    $.post('http://esx_police_cad/search-players', search);
}





