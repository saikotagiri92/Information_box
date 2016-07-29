function rcomments($scope){
$scope.usercomments=[{name: 'David Lewis', 
comment: "One option for learning development has always been to use an existing online environment.The curriculum takes a back-to-front approach to learning a Ruby on Rails workflow."},
{name: 'Rebbeca Buller', 
comment: 'The curriculum takes a back-to-front approach to learning a Ruby on Rails workflow. That means starting with a strong foundation in Ruby and an understanding of databases before migrating into Rails'}];    

$scope.addComment= function(){
	$scope.usercomments.push({name: "David Lewis", comment:$scope.addcomm});
}
}

//box add and switch starts here.
function allboxes($scope){
	$scope.boxes=[{name:'App Guidelines', content:'App Guidelines has a set of guiding principles to help you make the best choices when designing your app. These principles are the foundation for building great Web apps.',lastupdate:'2 hrs ago', url: 'reading'},
	{name:'Tech Stack', content:'This a box for all the Technical Solutions',lastupdate:'3 days ago', url: 'reading1'},
	{name:'Product User Manual', content:'Contains all the Details for user operation',lastupdate:'1 month ago', url: 'reading2'},
	{name:'App Documentation', content:'Contians the Documentation for the Application', lastupdate:'1 month ago', url: 'reading3'}
	];

	//$scope.addbox= function(){
	//	$scope.boxes.push({name:$scope.boxname, content: $scope.boxdescription, lastupdate:'just now'});
	//}
	$scope.addbox= function(){
		$scope.boxes.push({name:'asdaskd', content:"asdkhasd", lastupdate:'just now'});
	}

}