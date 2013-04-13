QuickSurvey API
---------------

API for web creator: http://quicksurvey.heroku.com/api

<table>
	<tr>
		<th> Event </th>
		<th> Path </th>
		<th> Params </th>
		<th> Object </th>
		<th> Comments </th>
	</tr>
	<tr>
		<td> Create </td>
		<td> /surveys/create.json</td>
		<td> 
			<ul>
				<li><b>title</b> required</li>
				<li><b>questions</b> required (title, type, options)</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		token: 
	}
}
			</pre>
		</td>
		<td>
		</td>
	</tr>	
	<tr>
		<td> Panel </td>
		<td> /surveys/:token/panel.json</td>
		<td> 
			<ul>
				<li><b>token</b> required survey token, embedded in url</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		title: ,
		token: ,
		questions: [{title:, token:, type:, stats: <see "refresh section ">}, ...]
	}
}
			</pre>
		</td>
		<td>			
		</td>
	</tr>
	<tr>
		<td> Refresh </td>
		<td> /questions/:token/refresh.json</td>
		<td> 
			<ul>
				<li><b>token</b> required question token, embedded in url</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		stats: [{value:, count:, type:}, ...]
	}
}
			</pre>
		</td>
		<td>			
		</td>
	</tr>
	<tr>
		<td> Ask </td>
		<td> /surveys/:token/ask.json</td>
		<td> 
			<ul>
				<li><b>token</b> required survey token, embedded in url</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		title: ,
		token: ,
		questions: [{title: , token: , type: , options: [content: , type: , token: ]}]
	}
}
			</pre>
		</td>
		<td>
		</td>
	</tr>	
	
	<tr>
		<td> Answer </td>
		<td> /questions/:token/answer.json</td>
		<td> 
			<ul>
				<li><b>token</b> required question token, embedded in url</li>
				<li><b>value</b> required response value: (option token for multiple-choice, plain text for fill-in)</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		message: <service feedback to survey takers>
	}
}
			</pre>
		</td>
		<td>			
		</td>
	</tr>
	
</table>