module com {
	export module google {
		export module analytics {
			export module utils {
				export class Version extends egret.HashObject {
					private _revision:number = 0;
					private _maxBuild:number = 255;
					private _maxMinor:number = 15;
					private _maxMajor:number = 15;
					private _separator:string = ".";
					private _maxRevision:number = 65535;
					private _build:number = 0;
					private _major:number = 0;
					private _minor:number = 0;

					public constructor(major:number = 0,minor:number = 0,build:number = 0,revision:number = 0)
					{
						super();
						super();
						var v:com.google.analytics.utils.Version = <any>null;
						if(major > this._maxMajor && minor == 0 && build == 0 && revision == 0)
						{
							v = com.google.analytics.utils.Version.fromNumber(major);
							major = flash.checkUint(v.major);
							minor = flash.checkUint(v.minor);
							build = flash.checkUint(v.build);
							revision = flash.checkUint(v.revision);
						}
						this.major = major;
						this.minor = minor;
						this.build = build;
						this.revision = revision;
					}

					public static fromString(value:string = "",separator:string = "."):com.google.analytics.utils.Version
					{
						var values:Array<any> = <any>null;
						var v:com.google.analytics.utils.Version = new com.google.analytics.utils.Version();
						if(value == "" || value == null)
						{
							return v;
						}
						if(value.indexOf(separator) > -1)
						{
							values = value.split(separator);
							v.major = flash.tranint(values[0]);
							v.minor = flash.tranint(values[1]);
							v.build = flash.tranint(values[2]);
							v.revision = flash.tranint(values[3]);
						}
						else
						{
							v.major = flash.tranint(value);
						}
						return v;
					}

					public static fromNumber(value:number = 0):com.google.analytics.utils.Version
					{
						var v:com.google.analytics.utils.Version = new com.google.analytics.utils.Version();
						if(isNaN(value) || value == 0 || value < 0 || value == Number.MAX_VALUE || value == Number.POSITIVE_INFINITY || value == Number.NEGATIVE_INFINITY)
						{
							return v;
						}
						v.major = value >>> 28;
						v.minor = (value & 251658240) >>> 24;
						v.build = (value & 16711680) >>> 16;
						v.revision = value & 65535;
						return v;
					}

					public toString(fields:number = 0):string
					{
						var arr:Array<any> = <any>null;
						if(fields <= 0 || fields > 4)
						{
							fields = flash.checkInt(this.getFields());
						}
						switch(fields)
						{
						case 1 :
							arr = [this.major];
							break;
						case 2 :
							arr = [this.major,this.minor];
							break;
						case 3 :
							arr = [this.major,this.minor,this.build];
							break;
						case 4 :
						default :
							arr = [this.major,this.minor,this.build,this.revision];
						}
						return arr.join(this._separator);
					}

					public set revision(value:number)
					{
						value = flash.checkUint(value);
						this._revision = flash.checkUint(Math.min(value,this._maxRevision));
					}

					public get revision():number
					{
						return this._revision;
					}

					public set build(value:number)
					{
						value = flash.checkUint(value);
						this._build = flash.checkUint(Math.min(value,this._maxBuild));
					}

					public set minor(value:number)
					{
						value = flash.checkUint(value);
						this._minor = flash.checkUint(Math.min(value,this._maxMinor));
					}

					public get build():number
					{
						return this._build;
					}

					public set major(value:number)
					{
						value = flash.checkUint(value);
						this._major = flash.checkUint(Math.min(value,this._maxMajor));
					}

					public get minor():number
					{
						return this._minor;
					}

					private getFields():number
					{
						var f:number = flash.checkInt(4);
						if(this.revision == 0)
						{
							f--;
						}
						if(f == 3 && this.build == 0)
						{
							f--;
						}
						if(f == 2 && this.minor == 0)
						{
							f--;
						}
						return f;
					}

					public valueOf():number
					{
						return this.major << 28 | this.minor << 24 | this.build << 16 | this.revision;
					}

					public get major():number
					{
						return this._major;
					}

					public equals(o:any):boolean
					{
						if(<any>!(flash.As3is(o,com.google.analytics.utils.Version)))
						{
							return false;
						}
						if(o.major == this.major && o.minor == this.minor && o.build == this.build && o.revision == this.revision)
						{
							return true;
						}
						return false;
					}

				}
			}
		}
	}
}

