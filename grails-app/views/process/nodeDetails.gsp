<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout"
               content="${params.isEmbedded == 'true' ? '' : 'grailsflow'}" />
         <g:render plugin="grailsflow" template="/commons/global"/>
         <r:require modules="grailsflowDatepicker"/>
         <title><g:message code="plugin.grailsflow.title.nodeDetails"/></title>
    </head>
    <body>
        <g:render plugin="grailsflow" template="/commons/messageInfo"/>

        <g:form controller="${params['controller']}" action="sendEvent" method="POST" enctype="multipart/form-data">
          <!-- data for validating errors -->
          <input type="hidden" name="nodeFormController" value="${params['controller']}"/>
          <input type="hidden" name="nodeFormAction" value="${params['action']}"/>
          <input type="hidden" name="nodeFormID" value="${params['id']}"/>
          <input type="hidden" name="isStarted" value="${nodeDetails.process.id != null}"/>
          <input type="hidden" name="processID" value="${nodeDetails.process.id}"/>
          <input type="hidden" name="nodeID" value="${nodeDetails.nodeID}"/>
          <input type="hidden" name="processType" value="${nodeDetails.process.type}"/>
          <g:if test="${params.isEmbedded}">
            <input type="hidden" name="isEmbedded" value="${params.isEmbedded}"/>
          </g:if>

          <gf:customizingTemplate template="${template}" defaultTemplate="/manualForms/automaticForm"
                  notFoundMessage="${templateNotFoundMessage}" model="[nodeDetails: nodeDetails]"/>
        </g:form>

    </body>
</html>
