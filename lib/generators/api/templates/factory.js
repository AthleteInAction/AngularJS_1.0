App.factory('ApiModelV<%= version %>',[
	'$resource',function($resource){
		return $resource("/api/v<%= version %>/:one/:two/:three/:four/:five/:six.json",
			{
				one: '@one',
				two: '@two',
				three: '@three',
				four: '@four',
				five: '@five',
				six: '@six'
			},
			{
				get: {method: 'GET'},
				query: {method: 'GET'},
				create: {method: 'POST'},
				save: {method: 'PUT'},
				destroy: {method: 'DELETE'}
			}
		);
	}
]);