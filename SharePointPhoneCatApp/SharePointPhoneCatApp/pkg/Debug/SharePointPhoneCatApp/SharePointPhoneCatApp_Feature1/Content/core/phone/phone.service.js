'use strict';

angular.
  module('core.phone').
  factory('Phone', ['$resource',

    function ($resource) {

        return $resource('//tristiancorp.sharepoint.com/_api/web/lists/GetByTitle(\'Phones%20List\')/items?$select=ID,Title,Age,ImageURL,PhoneId', {}, {
        query: {
          method: 'GET',
          params: {phoneId: 'phones'},
          isArray: true,
          headers: {
              "Accept": "application/json;odata=verbose"
          }
          /* its a GET, so we dont need the digest? headers: {
              "Accept": "application/json;odata=verbose",
              "content-type": "application/json;odata=verbose",
              "X-RequestDigest": $("#__REQUESTDIGEST").val()

          }*/
        }
      });
    }
  ]);


//1) original dont work as sharepoint dont serve static json return $resource('phones/txt/:phoneId', {}, {
//2) this works, but a bit pants... return $resource('phones/txt/:phoneId.txt', {}, { WORKS!!!
//3) move to azutre website configured to serve json mimetype  return $resource('//trisphones.azurewebsites.net/phones/:phoneId.json', {}, {  WORKS!!!
//4) get the sharepoint list as REST need to figure out passing id for querying...
//    https://tristiancorp.sharepoint.com/_api/web/lists/GetByTitle('Phones%20List')/items?$select=ID,Title,Age,ImageURL,PhoneId
//    for this we need to include the request digest for auth
//5) https://tristiancorp.sharepoint.com/_api/web/lists/GetByTitle('Phones%20List')/items?$filter=ID eq 1&$select=ID,Title,Age,ImageURL,PhoneId  ???  DOESNT WORK as cross domain call blocked
//6) todo 
