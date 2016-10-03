<%@ Page language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Content/bower_components/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="../Content/bower_components/angular/angular.js"></script>
    <script type="text/javascript" src="../Content/bower_components/angular-animate/angular-animate.js"></script>
    <script type="text/javascript" src="../Content/bower_components/angular-resource/angular-resource.js"></script>
    <script type="text/javascript" src="../Content/bower_components/angular-route/angular-route.js"></script>
    <script type="text/javascript" src="../Content/app.module.js"></script>
    <script type="text/javascript" src="../Content/app.config.js"></script>
    <script type="text/javascript" src="../Content/app.animations.js"></script>
    <script type="text/javascript" src="../Content/core/core.module.js"></script>
    <script type="text/javascript" src="../Content/core/checkmark/checkmark.filter.js"></script>
    <script type="text/javascript" src="../Content/core/phone/phone.module.js"></script>
    <script type="text/javascript" src="../Content/core/phone/phone.service.js"></script>
    <script type="text/javascript" src="../Content/phone-list/phone-list.module.js"></script>
    <script type="text/javascript" src="../Content/phone-list/phone-list.component.js"></script>
    <script type="text/javascript" src="../Content/phone-detail/phone-detail.module.js"></script>
    <script type="text/javascript" src="../Content/phone-detail/phone-detail.component.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link rel="stylesheet" type="text/css" href="../Content/bower_components/bootstrap/dist/css/bootstrap.css" />    
    <link rel="stylesheet" type="text/css" href="../Content/app.animations.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    

</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
    
    <div class="view-container" ng-app="phonecatApp">
      <div ng-view class="view-frame"></div>
    </div>

</asp:Content>
