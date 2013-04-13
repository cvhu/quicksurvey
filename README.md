QuickSurvey API
---------------

API for web creator: http://quicksurvey.heroku.com/api/surveys

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
		<td> /create.json</td>
		<td> 
			<ul>
				<li><b>title</b> required</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		name: 
	}
}
			</pre>
		</td>
		<td>
		</td>
	</tr>	
	<tr>
		<td> Panel </td>
		<td> /panel.json</td>
		<td> 
			<ul>
				<li><b>name</b> required name for survey</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		title: ,
		name: ,
		questions: [{title:, name:, type:, stats: <see "refresh section ">}, ...]
	}
}
			</pre>
		</td>
		<td>			
		</td>
	</tr>
	<tr>
		<td> Refresh </td>
		<td> /refresh.json</td>
		<td> 
			<ul>
				<li><b>name</b> required name for question</li>
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
</table>

-------------------


API for web taker: http://quicksurvey.heroku.com/api


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
		<td> /create.json</td>
		<td> 
			<ul>
				<li><b>title</b> required</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		name: 
	}
}
			</pre>
		</td>
		<td>
		</td>
	</tr>	
	
	<tr>
		<td> Panel </td>
		<td> /panel.json</td>
		<td> 
			<ul>
				<li><b>name</b> required</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {
		title: ,
		name: ,
		questions: [{title:, name:, type:, stats: <see "refresh section ">}, ...]
	}
}
			</pre>
		</td>
		<td>			
		</td>
	</tr>
	
</table>