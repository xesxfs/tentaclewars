module com {
	export module google {
		export module analytics {
			export module data {
				export class X10 extends egret.HashObject {
					private _delimEnd:string = ")";
					private _minimum:number = 0;
					private _delimSet:string = "*";
					private _escapeChar:string = "\'";
					private _delimBegin:string = "(";
					private _delimNumValue:string = "!";
					private _key:string = "k";
					private _set:Array<any>;
					private _hasData:number = 0;
					private _escapeCharMap:any;
					private _projectData:any;
					private _value:string = "v";

					public constructor()
					{
						super();
						super();
						this._set = [this._key,this._value];
						this._projectData = {};
						this._escapeCharMap = {};
						this._escapeCharMap[this._escapeChar] = "\'0";
						this._escapeCharMap[this._delimEnd] = "\'1";
						this._escapeCharMap[this._delimSet] = "\'2";
						this._escapeCharMap[this._delimNumValue] = "\'3";
						this._minimum = flash.checkInt(1);
					}

					private _setInternal(projectId:number,type:string,num:number,value:string)
					{
						if(<any>!this.hasProject(projectId))
						{
							this._projectData[projectId] = {};
						}
						if(this._projectData[projectId][type] == undefined)
						{
							this._projectData[projectId][type] = [];
						}
						this._projectData[projectId][type][num] = value;
						this._hasData = flash.checkInt(this._hasData + 1);
					}

					private _renderProject(project:any):string
					{
						var i:number = flash.checkInt(0);
						var data:Array<any> = <any>null;
						var result:string = "";
						var needTypeQualifier:boolean = <any>false;
						var l:number = flash.checkInt(this._set.length);
						for(i = flash.checkInt(0); i < l; i++)
						{
							data = project[this._set[i]];
							if(data)
							{
								if(needTypeQualifier)
								{
									result = result + this._set[i];
								}
								result = result + this._renderDataType(data);
								needTypeQualifier = false;
							}
							else
							{
								needTypeQualifier = true;
							}
						}
						return result;
					}

					public hasProject(projectId:number):boolean
					{
						return this._projectData[projectId];
					}

					public clearKey(projectId:number)
					{
						this._clearInternal(projectId,this._key);
					}

					private _renderDataType(data:Array<any>):string
					{
						var str:string = <any>null;
						var i:number = flash.checkInt(0);
						var result:Array<any> = [];
						for(i = flash.checkInt(0); i < data.length; )
						{
							if(data[i] != undefined)
							{
								str = "";
								if(i != this._minimum && data[i - 1] == undefined)
								{
									str = str + i.toString();
									str = str + this._delimNumValue;
								}
								str = str + this._escapeExtensibleValue(data[i]);
								result.push(str);
							}
							i++;
						}
						return this._delimBegin + result.join(this._delimSet) + this._delimEnd;
					}

					public getKey(projectId:number,num:number):string
					{
						return <string>this._getInternal(projectId,this._key,num);
					}

					public hasData():boolean
					{
						return this._hasData > 0;
					}

					public renderMergedUrlString(extObject:com.google.analytics.data.X10 = null):string
					{
						var projectId:any = null;
						if(<any>!extObject)
						{
							return this.renderUrlString();
						}
						var result:Array<any> = [extObject.renderUrlString()];
						for(projectId in this._projectData)
						{
							if(this.hasProject(flash.trannumber(projectId)) && <any>!extObject.hasProject(flash.trannumber(projectId)))
							{
								result.push(projectId + this._renderProject(this._projectData[projectId]));
							}
						}
						return result.join("");
					}

					public setValue(projectId:number,num:number,value:number):boolean
					{
						if(Math.round(value) != value || isNaN(value) || value == Infinity)
						{
							return false;
						}
						this._setInternal(projectId,this._value,num,value.toString());
						return true;
					}

					public renderUrlString():string
					{
						var projectId:any = null;
						var result:Array<any> = [];
						for(projectId in this._projectData)
						{
							if(this.hasProject(flash.trannumber(projectId)))
							{
								result.push(projectId + this._renderProject(this._projectData[projectId]));
							}
						}
						return result.join("");
					}

					private _getInternal(projectId:number,type:string,num:number):any
					{
						if(this.hasProject(projectId) && this._projectData[projectId][type] != undefined)
						{
							return this._projectData[projectId][type][num];
						}
						return undefined;
					}

					public setKey(projectId:number,num:number,value:string):boolean
					{
						this._setInternal(projectId,this._key,num,value);
						return true;
					}

					public clearValue(projectId:number)
					{
						this._clearInternal(projectId,this._value);
					}

					private _clearInternal(projectId:number,type:string)
					{
						var isEmpty:boolean = <any>false;
						var i:number = flash.checkInt(0);
						var l:number = flash.checkInt(0);
						if(this.hasProject(projectId) && this._projectData[projectId][type] != undefined)
						{
							this._projectData[projectId][type] = undefined;
							isEmpty = true;
							l = flash.checkInt(this._set.length);
							for(i = flash.checkInt(0); i < l; )
							{
								if(this._projectData[projectId][this._set[i]] != undefined)
								{
									isEmpty = false;
									break;
								}
								i++;
							}
							if(isEmpty)
							{
								this._projectData[projectId] = undefined;
								this._hasData = flash.checkInt(this._hasData - 1);
							}
						}
					}

					public getValue(projectId:number,num:number):any
					{
						var value:any = <any>this._getInternal(projectId,this._value,num);
						if(value == null)
						{
							return null;
						}
						return flash.trannumber(value);
					}

					private _escapeExtensibleValue(value:string):string
					{
						var i:number = flash.checkInt(0);
						var c:string = <any>null;
						var escaped:string = <any>null;
						var result:string = "";
						for(i = flash.checkInt(0); i < value.length; i++)
						{
							c = value.charAt(i);
							escaped = this._escapeCharMap[c];
							if(escaped)
							{
								result = result + escaped;
							}
							else
							{
								result = result + c;
							}
						}
						return result;
					}

				}
			}
		}
	}
}

