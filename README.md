QuickSurvey API
---------------

Testing API root: http://quicksurvey.heroku.com/api


<table>
	<tr>
		<th> Event </th>
		<th> Path </th>
		<th> Params </th>
		<th> Object </th>
		<th> Comments </th>
	</tr>
	<tr>
		<td> Create Survey </td>
		<td> /surveys/create.json</td>
		<td> 
			<ul>
				<li><b>title</b> required</li>
			</ul>
		</td>
		<td> 
			<pre>
{
	status: [success/fail],
	data: {url: [url for survey listening]}
}
			</pre>
	</tr>		
</table>
