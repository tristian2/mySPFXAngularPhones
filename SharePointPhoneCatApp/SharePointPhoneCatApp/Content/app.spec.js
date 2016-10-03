describe('PhoneListController', function() {

  beforeEach(module('phonecatApp'));

  it('should create a `phones` model with 3 phones', inject(function($controller) {
    var scope = {};
    var ctrl = $controller('PhoneListController', {$scope: scope});

    //expect(scope.phones.length).toBe(33); //fails 
    //failsexpect(scope.phones.length).toBe(3);//fails as we chnaged phone to fone
    failsexpect(scope.phones.length).toBe(3);//fails as we chnaged phone to fone
    //expect(scope.name).toBe('Trist');  //fails
    expect(scope.name).toBe('Tristian');  //fails
  }));

});