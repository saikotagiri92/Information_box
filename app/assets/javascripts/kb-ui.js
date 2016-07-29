$(function(){

tinyMCE.DOM.remove('#mce_42-body', '.mce-flow-layout, .mce-container-body');

//add class Active
$("#profile a:contains('Profile')").addClass('setting-side-bar-active active')
$("#settings a:contains('Settings')").addClass('setting-side-bar-active active')
$("#roles a:contains('Roles')").addClass('setting-side-bar-active active')
$("#organisation_people a:contains('People')").addClass('setting-side-bar-active active')


// Unobstructive javascript for preventing multiple form submission
$("form.kbapp-form").submit(function() {
    $(this).submit(function() {
        
        return false;
    
    });
    $(".kbapp-form-button").prop('disabled', true);
    return true;
});


//resizable authoring sidebar


var key=[
                        
             { value: "App Guidelines", url: 'reading' }, 
             { value: "Dashboard", url: 'dashboard' },
             { value: "Add Article", url: 'authoring' },
             { value: "Profile", url: '/user/profile' },
             { value: "Password", url: '/user/password-reset' },
             { value: "Notification", url: 'account_notification' },
             { value: "Analytics", url: 'analytics' },
             { value: "Settings", url: '/organisation/setting' },
             { value: "People", url: '/organisation/people' },
             { value: "Team", url: '/organisation/teams' },
             { value: "Billing", url: 'organisation_billing' },
             { value: "Signup Options", url: 'signup_options' },
             { value: "Signup", url: '/Signup' },
             { value: "Login", url: '/login' }
        ];



//radio buttons
$('.radio-text1').hide();
$('.radio-text2').hide();

if($('#optionscheckbox').not(':checked')){$('#optionsRadios1').attr('disabled', 'disabled'); 
$('#optionsRadios2').attr('disabled', 'disabled');   }
else{$('#optionsRadios1').attr('disabled', false);
$('#optionsRadios2').attr('disabled',false );
}
                                    //if not checked then radios disabled
$('#optionscheckbox').on('click',function(){$('#optionsRadios1').attr('disabled', false);
$('#optionsRadios2').attr('disabled',false ); 
$('#optionscheckbox').is(':checked')= 'true';
});	// on click enable the radios

$('#optionsRadios1').on('click',function(){ $('.radio-text1').show(); $('.radio-text2').hide();});
$('#optionsRadios2').on('click',function(){ $('.radio-text2').show();$('.radio-text1').hide(); });


//reading sidebar

    // set effect from select menu value
    $("#toggler").click(function() {
     $( "#effect" ).toggle('blind',500);
     // runEffect();
      $(".this").toggleClass("highlight");
      $(".image-folder1").toggle();
      $(".image-folder2").toggle();
      return false;
    });

    $("#toggler1").click(function() {
      $( "#effect1" ).toggle('blind',500);
      //runEffectdraft();
      $(".this").toggleClass("highlight");
      $(".image-folder3").toggle();
      $(".image-folder4").toggle();
      return false;
    });

//add css to sidebar list to make them bold.
$(".row-intro a:contains('Introduction')").css('font-weight', 'bold');
$(".row-webdev a:contains('Web Developer')").css('font-weight', 'bold');
$(".row-install a:contains('Installation')").css('font-weight', 'bold');
$(".row-basics a:contains('101')").css('font-weight', 'bold');
$(".row-ruby a:contains('Ruby')").css('font-weight', 'bold');
$(".row-git a:contains('Git')").css('font-weight', 'bold');
$(".page1 a:contains('1')").css('font-weight', 'bold');
$(".page2 a:contains('2')").css('font-weight', 'bold');
$(".page3 a:contains('3')").css('font-weight', 'bold');

$("#user-permission").click(function(){
$(".create-box-tabs").toggle();
});

$( ".add-team-members" ).click(function(){
  $(this).children().css( {"border":"2px solid #046cfc", "border-radius": "2px" });
});

//marks the end of this js

});


