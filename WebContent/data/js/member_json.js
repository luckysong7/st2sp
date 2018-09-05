/**
 * 
 */
var com = new Object();

com.util = new Object();
com.util.Member = function(id,name,addr){
	this.id = id;
	this.name = name;
	this.addr = addr;
};

com.util.Member.prototype = {
		setValue:function(id,name,addr){
			this.id = id;
			this.name = name;
			this.addr = addr;
		},
		
		setId:function(id){
			this.id = id;
		},
		setName:function(name){
			this.name = name;
		},
		setAddr:function(addr){
			this.addr = addr;
		},
		
		getValue:function(){
			return this.id + " : " + this.name + " : " + this.addr;
		},
		getId:function(){
			return this.id;
		},
		
		toString:function(){
			return this.id + " | " + this.name + " | " + this.addr; 
		}
}