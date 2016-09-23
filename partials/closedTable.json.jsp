<%@include file="../bundle/initialization.jspf" %>

<c:set scope="request" var="submissionList" value="${SubmissionHelper.getPaginatedSubmissions()}"/>

<json:object>
    <json:property name="nextPageToken" value="${submissionList.getNextPageToken()}"/>
    <json:array name="columns">
        <json:object>
            <json:property name="title" value="Item Requested"/>
            <json:property name="data" value="Form"/>
        </json:object>
        <json:object>
            <json:property name="title" value="Details"/>
            <json:property name="data" value="Submission"/>
            <json:property name="className" value="data-link"/>
        </json:object>
        <json:object>
            <json:property name="title" value="Date Submitted"/>
            <json:property name="data" value="Updated At"/>
            <json:property name="className" value="data-moment"/>
        </json:object>
        <json:object>
            <json:property name="title" value="State"/>
            <json:property name="data" value="State"/>
            <json:property name="className" value="data-label"/>
        </json:object>
    </json:array>
    <json:array name="data" var="submission" items="${submissionList}">
        <json:object>
            <json:property name="Updated At" value="${time.format(submission.createdAt)}"/>
            <json:property name="Form" value="${text.escape(submission.form.name)}"/>
            <json:property name="Submission" value="${text.escape(submission.label)}"/>
            <json:property name="State" value="${submission.coreState}"/>
            <json:property name="Id" value="${submission.id}"/>
        </json:object>
    </json:array>
</json:object>