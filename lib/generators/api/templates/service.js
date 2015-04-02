App.service('<%= name.capitalize %>SVC',['ApiModelV<%= version %>',function(ApiModelV<%= version %>){

	this.<%= name %>s = {

		loading: {},

		list: [],

		find: function(id,complete){

			var t = this;

			var obj = t.new({id: id});

			obj.loading = true;

			var options = {
				one: '<%= name %>s',
				id: id
			};

			ApiModelV1.get(options,function(data){

				var u = t.new(data.<%= name %>);

				angular.forEach(u,function(val,key){

					obj[key] = val;

				});

				if (complete){complete(obj,false);}

				delete obj.loading;

			},function(data){

				if (complete){complete(data,true);}

				delete obj.loading;

			});

			return obj;

		},

		get: function(complete){

			var t = this;

			t.loading.get = true;

			var options = {
				one: '<%= name %>s'
			};

			ApiModelV<%= version %>.query(options,function(data){

				var list = [];

				angular.forEach(data.<%= name %>s,function(val,key){

					list.push(t.new(val));

				});

				t.list = list;
				
				delete t.loading.get;

				if (complete){complete(t.list,false);}

			},function(data){

				delete t.loading.get;

				if (complete){complete(data,true);}

			});

		},

		new: function(<%= name %>){

			var t = this;

			if (!<%= name %>){<%= name %> = {};}

			<%= name %>.save = function(complete){

				<%= name %>.loading = true;

				var options = {
					one: '<%= name %>s'
				};

				var <%= name.capitalize %> = new ApiModelV<%= version %>({<%= name %>: <%= name %>});

				if (<%= name %>.id){

					options.id = <%= name %>.id;

					<%= name.capitalize %>.$save(options,function(data){

						<%= name %>.updated_at = data.<%= name %>.updated_at;

						delete <%= name %>.loading;

						if (complete){complete(data.<%= name %>,false);}

					},function(data){

						delete <%= name %>.loading;

						if (complete){complete(data,true);}

					});


				} else {

					<%= name.capitalize %>.$create(options,function(data){

						<%= name %>.id = data.<%= name %>.id;
						<%= name %>.created_at = data.<%= name %>.created_at;
						<%= name %>.updated_at = data.<%= name %>.updated_at;

						delete <%= name %>.loading;

						t.list.unshift(<%= name %>);

						if (complete){complete(data.<%= name %>,false);}

					},function(data){

						delete <%= name %>.loading;

						if (complete){complete(data,true);}

					});

				}

			};

			<%= name %>.delete = function(complete){

				<%= name %>.loading = true;

				var options = {
					one: '<%= name %>s',
					id: <%= name %>.id
				};

				ApiModelV<%= version %>.destroy(options,function(data){

					t.list.removeWhere('id',<%= name %>.id);

					delete <%= name %>.loading;

					if (complete){complete(data,false);}

				},function(data){

					delete <%= name %>.loading;

					if (complete){complete(data,true);}

				});

			};

			return <%= name %>;

		}

	};

}]);