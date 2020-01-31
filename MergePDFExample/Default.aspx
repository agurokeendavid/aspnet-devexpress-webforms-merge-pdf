<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="MergePDFExample._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder_MasterRoot_Head" runat="server">
    <script type="text/javascript">
        function onFileUploadComplete(s, e) {
            tokenboxAddUploadedAttachment.AddToken(e.callbackData);
        }

        function onClick(s, e) {
            if (confirm("Confirm uploading of file? ")) {
                callbackpanelAdd.PerformCallback();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallbackPanel runat="server" ID="callbackpanelAdd" ClientInstanceName="callbackpanelAdd" OnCallback="callbackpanelAdd_Callback">
        <PanelCollection>
            <dx:PanelContent>
                <dx:ASPxFormLayout runat="server">
                    <SettingsItemCaptions Location="Top" />
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                    <Items>
                        <dx:LayoutGroup Caption="Add Information">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel runat="server" ID="labelMessage" Visible="false" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Title">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox runat="server" ID="textboxTitle" NullText="Please enter title here..." Width="100%" ClientInstanceName="textboxTitle" TabIndex="0" MaxLength="50">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Attachment" HelpText="Multiple attachments are not allowed.">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTokenBox runat="server" AllowCustomTokens="false" ID="tokenboxAddUploadedAttachment" Width="100%" ClientInstanceName="tokenboxAddUploadedAttachment" TabIndex="1">
                                            </dx:ASPxTokenBox>
                                            <dx:ASPxUploadControl runat="server" ShowProgressPanel="true" AutoStartUpload="true" ID="uploadcontrolAddAttachment" Width="100%" TabIndex="2" OnFileUploadComplete="uploadcontrolAddAttachment_FileUploadComplete">
                                                <AdvancedModeSettings EnableMultiSelect="true" />
                                                <ClientSideEvents FileUploadComplete="function(s,e) { onFileUploadComplete(s, e); }" />
                                            </dx:ASPxUploadControl>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" HorizontalAlign="Center">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton runat="server" Text="Submit" CssClass="btn green darken-1 waves-effect waves-light" TabIndex="3" AutoPostBack="false">
                                                <ClientSideEvents Click="function (s, e) { onClick(s, e); }" />

                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
        <ClientSideEvents EndCallback="function(s, e) { onEndCallback(s,e); }" />
    </dx:ASPxCallbackPanel>
</asp:Content>
