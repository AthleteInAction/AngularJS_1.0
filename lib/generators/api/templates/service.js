App.service('<%= name.capitalize %>SVC',['ApiModelV<%= version %>',function(ApiModelV<%= version %>){

	this.<%= name %>s = {

		loading: {},

		list: [],

		get: function(){

			var t = this;

			t.loading.get = true;

			var options = {
				one: '<%= name %>s'
			};

			ApiModelV<%= version %>.query(options,function(data){

				t.list = data.<%= name %>s;
				
				delete t.loading.get;

			},function(data){

				delete t.loading.get;

			});

		},

		new: function(<%= name %>){

			var t = this;

			<%= name %>.save = function(complete){

				m.loading = true;

				var options = {
					one: '<%= name %>s'
				};

				var <%= name.capitalize %> = new ApiModelV<%= version %>({<%= name %>: <%= name %>});

				<%= name.capitalize %>.$create(options,function(data){

					m.id = data.<%= name %>.id;

					t.list.unshift(m);

					delete m.loading;

					if (complete){complete();}

				},function(data){

					delete m.loading;

					if (complete){complete();}

				});

			};

		}

	};

}]);