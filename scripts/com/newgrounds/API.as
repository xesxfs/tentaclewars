package com.newgrounds
{
   import com.adobe.crypto.MD5;
   import com.adobe.images.PNGEncoder;
   import com.newgrounds.components.FlashAd;
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class API
   {
      
      public static const VERSION:String = "2.4.18";
      
      private static var do_echo:Boolean = false;
      
      private static const GATEWAY_URL:String = "http://www.ngads.com/gateway_v2.php";
      
      private static const AD_TERMS_URL:String = "http://www.newgrounds.com/wiki/flashads/terms/";
      
      private static const COMMANDS_WIKI_URL:String = "http://www.newgrounds.com/wiki/flashapi/commands/";
      
      private static var _debug:Boolean = true;
      
      private static var _connected:Boolean = false;
      
      private static var _isMetadataLoaded:Boolean = false;
      
      private static var _preloadComplete:Boolean = false;
      
      private static var _adsApproved:Boolean = false;
      
      private static var _saveGroupId:uint;
      
      private static var _saveFileId:uint;
      
      private static var _trackerId:uint;
      
      private static var _movieId:String;
      
      private static var _encryptionKey:String;
      
      private static var _url:String;
      
      private static var _host:String;
      
      private static var connected:Boolean;
      
      private static var version:String;
      
      private static var ad_url:String;
      
      private static var _fakeSession:Boolean = false;
      
      private static var publisher_id:uint;
      
      private static var session_id:String;
      
      private static var user_email:String;
      
      private static var user_name:String;
      
      private static var user_id:uint;
      
      private static var userpage_format:String;
      
      private static var _medals:Array;
      
      private static var timeoutTimer:Timer;
      
      private static var _userpageFormat:String;
      
      private static var _scoreboards:Array;
      
      private static var _bridge:Bridge;
      
      private static var save_file:SaveFile;
      
      private static var _imageFilePath:String;
      
      private static var _saveFilePath:String;
      
      private static var _saveGroups:Array = [];
      
      private static var root:DisplayObject;
      
      private static var _eventDispatcher:EventDispatcher = new EventDispatcher();
      
      private static var score_page_counts:Object = new Object();
      
      private static var compression_radix:String = "/g8236klvBQ#&|;Zb*7CEA59%s`Oue1wziFp$rDVY@TKxUPWytSaGHJ>dmoMR^<0~4qNLhc(I+fjn)X";
      
      private static var compressor:BaseN = new BaseN(compression_radix);
      
      public static var errors:Dictionary = APIError.init_codes();
      
      private static var sharedObjects:Dictionary;
      
      private static var _preloadAssets:Array;
      
      public static var periods:Object = method_175();
      
      private static var period_aliases:Object = {
         "t":{
            "name":"Today",
            "alias":"TODAY"
         },
         "p":{
            "name":"Yesterday",
            "alias":"YESTERDAY"
         },
         "w":{
            "name":"This Week",
            "alias":"THIS_WEEK"
         },
         "m":{
            "name":"This Month",
            "alias":"THIS_MONTH"
         },
         "y":{
            "name":"This Year",
            "alias":"THIS_YEAR"
         },
         "a":{
            "name":"All-Time",
            "alias":"ALL_TIME"
         }
      };
      
      private static var secureCommand:String;
       
      
      public function API()
      {
         super();
      }
      
      public static function get adFeedURL() : String
      {
         return ad_url;
      }
      
      public static function get preloadComplete() : Boolean
      {
         return _preloadComplete;
      }
      
      private static function method_330() : Boolean
      {
         if(!_connected)
         {
            §§push(false);
            §§push(true);
         }
         else
         {
            §§push(true);
         }
         return §§pop();
      }
      
      public static function setVersion(v:String) : void
      {
         version = v;
      }
      
      public static function setUserEmail(e:String) : void
      {
         user_email = e;
      }
      
      public static function setFakeSession(fake:Boolean) : void
      {
         _fakeSession = fake;
      }
      
      public static function getFakeSession() : Boolean
      {
         return _fakeSession;
      }
      
      public static function get debugMode() : Boolean
      {
         return _debug;
      }
      
      public static function set debugMode(value:Boolean) : void
      {
         _debug = value;
      }
      
      public static function getTrackerID() : uint
      {
         return _trackerId;
      }
      
      public static function getUserID() : uint
      {
         return user_id;
      }
      
      public static function getUserName() : String
      {
         return user_name;
      }
      
      public static function isConnected() : Boolean
      {
         return _connected;
      }
      
      public static function getID() : uint
      {
         return _trackerId;
      }
      
      public static function getOfficialURL() : String
      {
         var o_url:* = false;
         §§push(true);
         §§push(GATEWAY_URL);
         if(debugMode)
         {
            o_url = o_url + "&debug=1";
         }
         return o_url;
      }
      
      public static function get adsApproved() : Boolean
      {
         return _adsApproved;
      }
      
      public static function hasUserSession() : Boolean
      {
         return session_id != null && session_id != "" && publisher_id != 0;
      }
      
      public static function isNewgrounds() : Boolean
      {
         return publisher_id == 1 || _host.toLowerCase().indexOf("ungrounded.net") > -1;
      }
      
      public static function hostIsCompatible() : Boolean
      {
         return publisher_id != 0;
      }
      
      public static function hasUserEmail() : Boolean
      {
         return user_email != "";
      }
      
      public static function connectionTimeOut(e:Event = null) : void
      {
      }
      
      public static function connect(loaderInfo:LoaderInfo, m_id:String, encrypt_key:String = null) : void
      {
         §§push(true);
         if(!loaderInfo)
         {
            method_53("Null loaderInfo paremeter passed in to connectMovie!","");
            return;
         }
         try
         {
            var /*UnknownSlot*/:* = loaderInfo.loader.loaderInfo;
         }
         catch(error:Error)
         {
         }
         _url = loaderInfo.url;
         _host = _url;
         §§push(_host.indexOf("http://") > -1);
         if(flashVars.NewgroundsAPI_UserName)
         {
            user_name = flashVars.NewgroundsAPI_UserName;
         }
         if(flashVars.NewgroundsAPI_UserID)
         {
            user_id = flashVars.NewgroundsAPI_UserID;
         }
         if(flashVars.NewgroundsAPI_PublisherID)
         {
            §§push(true);
         }
         else
         {
            publisher_id = 0;
            if(flashVars.NewgroundsAPI_UserpageFormat)
            {
               _userpageFormat = flashVars.NewgroundsAPI_UserpageFormat;
            }
            if(flashVars.NewgroundsAPI_SessionID)
            {
               session_id = flashVars.NewgroundsAPI_SessionID;
            }
            if(flashVars.NewgroundsAPI_SaveGroupID)
            {
               _saveGroupId = flashVars.NewgroundsAPI_SaveGroupID;
            }
            if(flashVars.NewgroundsAPI_SaveFileID)
            {
               _saveFileId = flashVars.NewgroundsAPI_SaveFileID;
            }
            if(flashVars.NewgroundsAPI_SandboxID)
            {
               _bridge = new Bridge(flashVars.NewgroundsAPI_SandboxID);
            }
            if(connected)
            {
               method_53("NewgroundsAPI.connect() - connection already in progress","connect");
               return;
            }
            timeoutTimer.start();
            if(!m_id)
            {
               method_53("NewgroundsAPI.connectMovie() - missing required movieId parameter","connectMovie");
            }
            _movieId = String(m_id);
            _trackerId = uint(_movieId.substring(0,_movieId.indexOf(":")));
            _encryptionKey = encrypt_key;
         }
         connected = true;
         sendCommand("connectMovie",{
            "host":method_50(),
            "movie_version":version
         });
      }
      
      private static function method_50() : String
      {
         return _host;
      }
      
      public static function isPublishedHost() : Boolean
      {
         return method_50().indexOf("file://") == -1;
      }
      
      public static function loadUserPage(userId:uint = 0, userName:String = null) : Boolean
      {
         var userPage:* = null;
         if(userId == 0 && userName == null)
         {
            if(hasUserSession())
            {
               userId = user_id;
               userName = user_name;
            }
            else
            {
               return false;
            }
         }
         if(publisher_id == 1)
         {
            userPage = "http://" + userName.toLowerCase() + ".newgrounds.com";
            navigateToURL(new URLRequest(userPage),"_blank");
            return true;
         }
         if(userpage_format)
         {
            userPage = userPage.split(":user_name:").join(escape(userName));
            navigateToURL(new URLRequest(userPage),"_blank");
            return true;
            §§push(true);
         }
         else
         {
            return false;
         }
      }
      
      public static function loadNewgrounds() : void
      {
         sendCommand("loadNewgrounds",{"host":method_50()},true);
      }
      
      public static function loadOfficialURL() : void
      {
         navigateToURL(new URLRequest(getOfficialURL()));
      }
      
      public static function loadMySite() : void
      {
         sendCommand("loadMySite",{"host":method_50()},true);
      }
      
      public static function loadCustomLink(link:String) : void
      {
         sendCommand("loadCustomLink",{
            "host":method_50(),
            "link":link
         },true);
      }
      
      public static function logCustomEvent(event:String) : void
      {
         sendCommand("logCustomEvent",{
            "host":method_50(),
            "event":event
         });
      }
      
      public static function getScoreBoard(name:String) : ScoreBoard
      {
         var board:ScoreBoard = null;
         for each(board in _scoreboards)
         {
            if(board.name == name)
            {
               return board;
            }
         }
         return null;
      }
      
      public static function getScoreBoardById(id:uint) : ScoreBoard
      {
         var board:ScoreBoard = null;
         for each(board in _scoreboards)
         {
            if(board.id == id)
            {
               return board;
            }
         }
         return null;
      }
      
      public static function postScore(boardName:String, value:uint, tag:String = "") : void
      {
         §§push(true);
         if(!boardName || boardName == "")
         {
            method_49({"command_id":method_51("postScore")},new APIError("MISSING_PARAM","missing required parameter(s)"));
            return;
         }
         if(tag == null)
         {
            tag = "";
         }
         sendSecureCommand("postScore",{
            "user_name":user_name,
            "board":boardName,
            "value":value,
            "publisher_id":publisher_id,
            "tag":tag
         });
      }
      
      public static function loadScores(boardName:String, period:String = null, tag:String = null) : void
      {
         var command_name:String = true;
         var board:ScoreBoard = getScoreBoard(boardName);
         §§push("loadScores");
         if(!board || !board.id)
         {
            method_49({"command_id":method_51(command_name)},new APIError("MISSING_PARAM","missing required ScoreBoard instance"));
            return;
         }
         var params:Object = {};
         params.publisher_id = publisher_id;
         if(period)
         {
            params.period = period;
         }
         else
         {
            params.period = board.period;
         }
         params.board = board.id;
         params.num_results = board.num_results;
         params.page = board.page;
         if(!tag || tag == "")
         {
            params.tag = board.tag;
         }
         else
         {
            params.tag = tag;
         }
         sendCommand(command_name,params);
         return;
         §§push(true);
      }
      
      public static function loadScoresInRange(boardName:String, period:String = "All-Time", startRank:uint = 1, endRank:uint = 10) : void
      {
         if(!boardName || boardName == "")
         {
            return;
            §§push(true);
         }
         else
         {
            var scoreboard:ScoreBoard = getScoreBoard(boardName);
            if(scoreboard)
            {
               scoreboard.loadScoresInRange(period,startRank,endRank);
            }
            else
            {
               method_48("loadScoresInRange: Scoreboard " + boardName + " could not be found.");
            }
            return;
         }
      }
      
      private static function method_87(medal_list:Array) : void
      {
         var m:Object = null;
         if(_medals === null)
         {
            _medals = new Array();
            for(; 0 < medal_list.length; §§push(true))
            {
               m = medal_list[0];
               _medals.push(Medal.createFromObject(m));
            }
            §§push(true);
            §§push(true);
            §§push(true);
         }
         sendMessage("Medals loaded!");
      }
      
      private static function method_120(saveGroupList:Array) : void
      {
         var saveGroup:SaveGroup = null;
         while(0 < saveGroupList.length)
         {
            saveGroup = SaveGroup.createFromObject(saveGroupList[0]);
            _saveGroups.push(saveGroup);
            §§push(true);
            §§push(true);
         }
      }
      
      private static function method_163(scoreBoards:Array) : void
      {
         _scoreboards = [];
         for(var i:uint = 0; i < scoreBoards.length; i++)
         {
            _scoreboards.push(new ScoreBoard(scoreBoards[i].id,scoreBoards[i].name,""));
         }
      }
      
      public static function getMedals() : Array
      {
         return _medals;
      }
      
      public static function getMedalById(medalId:uint) : Medal
      {
         var medal:Medal = null;
         for each(medal in _medals)
         {
            if(medal.id == medalId)
            {
               return medal;
               §§push(true);
            }
            else
            {
               continue;
            }
         }
         return null;
      }
      
      public static function getMedal(medalName:String) : Medal
      {
         var medal:Medal = null;
         for each(medal in _medals)
         {
            if(medal.name == medalName)
            {
               return medal;
            }
         }
         return null;
      }
      
      public static function unlockMedal(medalName:String) : void
      {
         var params:Object = null;
         var medalsUnlocked:Object = null;
         if(!medalName || medalName == "")
         {
            method_49({"command_id":method_51("unlockMedal")},new APIError("MISSING_PARAM","missing required medal name"));
            return;
         }
         var medal:Medal = getMedal(medalName);
         if(!medal)
         {
            §§push(true);
         }
         else
         {
            if(hasUserSession() || debugMode)
            {
               sendMessage("Attempting to unlock \'" + medal.name + "\'");
               if(medal.unlocked)
               {
                  method_48("Medal \'" + medal.name + "\' is already unlocked!");
                  return;
               }
               params = new Object();
               params.medal_id = medal.id;
               sendSecureCommand("unlockMedal",params);
            }
            else
            {
               sendMessage("Locally unlocking " + medal.name);
            }
            addr254:
            return;
         }
         if(medal.unlocked)
         {
            method_48("Medal \'" + medal.name + "\' is already unlocked!");
            return;
         }
         medal.unlocked = true;
         medalsUnlocked = loadLocal("medals_unlocked");
         if(!medalsUnlocked)
         {
            medalsUnlocked = new Object();
         }
         medalsUnlocked[medal.id.toString()] = true;
         saveLocal("medals_unlocked",medalsUnlocked);
         callListener(APIEvent.UNLOCK_MEDAL,true,{"medal":medal});
         §§goto(addr254);
      }
      
      public static function loadMedals() : void
      {
         §§push(true);
         if(_medals)
         {
            dispatchEvent(new APIEvent(APIEvent.MEDALS_LOADED,true,{"medals":getMedals()}));
            return;
         }
         var params:Object = new Object();
         params.user_id = user_id;
         return;
         §§push(false);
         §§push(false);
      }
      
      public static function saveLocal(save_id:String, save_data:Object, size_allocation:uint = 0) : void
      {
         var sharedObj:SharedObject = null;
         var /*UnknownSlot*/:* = size_allocation;
         try
         {
            if(!sharedObjects[save_id])
            {
               sharedObjects[save_id] = SharedObject.getLocal("ng_ap_secure_" + _trackerId + "_" + save_id);
            }
            sharedObj = sharedObjects[save_id];
            sharedObj.data[save_id] = encodeData(save_data);
            sharedObj.flush();
            return;
         }
         catch(e:Error)
         {
            method_48("saveLocal ERROR: " + e);
            return;
         }
      }
      
      public static function loadLocal(save_id:String) : Object
      {
         var sharedObj:SharedObject = null;
         try
         {
            if(!sharedObjects[save_id])
            {
               sharedObjects[save_id] = SharedObject.getLocal("ng_ap_secure_" + _trackerId + "_" + save_id);
            }
            sharedObj = sharedObjects[save_id];
            if(sharedObj && sharedObj.data && sharedObj.data[save_id])
            {
               return decodeData(sharedObj.data[save_id]);
            }
            return null;
         }
         catch(e:Error)
         {
            method_48("loadLocal ERROR: " + e);
         }
         return null;
      }
      
      public static function encodeData(data:Object) : String
      {
         return method_85(RC4.encrypt(com.adobe.serialization.json.JSON.encode(data),_encryptionKey));
      }
      
      public static function decodeData(base:String) : *
      {
         return com.adobe.serialization.json.JSON.decode(RC4.decrypt(method_143(base),_encryptionKey));
      }
      
      private static function method_85(hex_value:String) : String
      {
         var offset:uint = hex_value.length % 6;
         var basen_value:* = "";
         for(var i:uint = 0; i < hex_value.length; )
         {
            basen_value = true;
            i = i + 6;
            §§push(basen_value);
         }
         return offset.toString() + basen_value;
      }
      
      private static function method_143(base_value:String) : String
      {
         var hl:uint = 0;
         var chunk:String = null;
         var num:uint = 0;
         var hex:String = null;
         var offset:uint = uint(base_value.charAt(0));
         var hex_value:String = "";
         for(var i:uint = 1; i < base_value.length; i = i + 4)
         {
            chunk = base_value.substr(i,4);
            num = uint(compressor.decode(chunk));
            hex = num.toString(16);
            if(i + 4 < base_value.length)
            {
               hl = 6;
            }
            else
            {
               hl = offset;
            }
            while(hex.length < hl)
            {
               hex = "0" + hex;
            }
            hex_value = hex_value + hex;
         }
         return hex_value;
      }
      
      public static function getSaveGroupById(groupId:uint) : SaveGroup
      {
         if(!_saveGroups || _saveGroups.length < 1)
         {
            method_48("No save groups found");
            return null;
         }
         if(0 >= _saveGroups.length)
         {
            return null;
         }
         return 0[true];
         §§push(_saveGroups);
      }
      
      public static function getSaveGroup(groupName:String) : SaveGroup
      {
         if(!_saveGroups || _saveGroups.length < 1)
         {
            method_48("No save groups found");
            return null;
         }
         for(var i:uint = 0; i < _saveGroups.length; )
         {
            if(_saveGroups[i].name == groupName)
            {
               return _saveGroups[i];
            }
            i++;
         }
         return null;
      }
      
      public static function getCurrentSaveFile() : *
      {
         return save_file;
      }
      
      public static function setCurrentSaveFile(current:SaveFile) : *
      {
      }
      
      public static function newSaveQuery(groupName:String) : SaveGroupQuery
      {
         var group:SaveGroup = getSaveGroup(groupName);
         §§push(true);
         if(group)
         {
            return group.newQuery();
         }
         return null;
      }
      
      public static function executeSaveQuery(query:SaveGroupQuery) : void
      {
         sendCommand("lookupSaveFiles",{
            "publisher_id":publisher_id,
            "group_id":query.groupId,
            "query":com.adobe.serialization.json.JSON.encode(query.toObject())
         },false,null,query);
      }
      
      public static function lookupSaveFiles(saveGroup:SaveGroup) : void
      {
         var query:SaveGroupQuery = saveGroup.getQuery(false);
         "lookupSaveFiles".sendCommand("publisher_id",{
            true:publisher_id,
            "group_id":saveGroup.id,
            "query":query.toObject()
         },false,null,query);
      }
      
      public static function checkFilePrivledges(file:SaveFile) : void
      {
         sendCommand("checkFilePrivs",{
            "group":file.groupId,
            "filename":file.name,
            "user_id":(!!user_id?user_id:0),
            "publisher_id":publisher_id
         });
      }
      
      public static function newSaveFile(groupName:String) : SaveFile
      {
         var group:SaveGroup = getSaveGroup(groupName);
         §§push(true);
         §§push(true);
         if(group)
         {
            return new SaveFile(group);
         }
         method_49({"command_id":"newSaveFile"},new APIError("INVALID_SAVE_GROUP","\'" + group + "\' is not a valid save group."));
         return null;
      }
      
      public static function saveFile(file:SaveFile, overwrite:Boolean = false, draft:Boolean = false) : void
      {
         var params:Object = file.toObject();
         params.user_name = user_name;
         if(file.id)
         {
            params.save_id = file.id;
         }
         params.overwrite = !!overwrite?1:0;
         if(draft)
         {
            params.draft = 1;
         }
         var byteArray:ByteArray = new ByteArray();
         if(file.contents is ByteArray)
         {
            byteArray.writeByte(0);
            §§push(true);
         }
         else
         {
            byteArray.writeByte(1);
            byteArray.writeObject(file.contents);
            byteArray.compress();
         }
         var files:Object = new Object();
         files.file = byteArray;
         if(file.thumbnail)
         {
            files.thumbnail = PNGEncoder.encode(file.thumbnail);
         }
         save_file = file;
         sendSecureCommand("saveFile",params,null,files,file);
      }
      
      public static function rateSaveFile(file:SaveFile, rating:SaveRating, vote:Number) : void
      {
         "rateSaveFile".sendSecureCommand("group",{
            file.groupId:"save_id",
            file.id:"rating_id",
            rating.id:"vote",
            true:vote,
            "user_id":user_id
         },null,null,file);
      }
      
      public static function loadSaveFile(save_id:Number, get_contents:Boolean = true) : *
      {
         var packet:Object = {
            "publisher_id":publisher_id,
            "save_id":save_id,
            "get_contents":get_contents
         };
         save_file = null;
         sendCommand("loadSaveFile",packet);
      }
      
      public static function loadFilesByDate(groupName:String, sortDescending:Boolean = true, keyName:String = null, keyValue:* = null) : void
      {
         var error:* = undefined;
         var group:SaveGroup = getSaveGroup(groupName);
         if(!group)
         {
            error = new APIError("QUERY_INCOMPLETE","The query could not be preformed, check the spelling of your save group name.");
            method_49({"command_id":"loadFilesByDate"},error);
            return;
         }
         var query:SaveGroupQuery = group.newQuery();
         if(keyName)
         {
            query.addKeyCondition(keyName,"=",keyValue);
         }
         query.sortOn(SaveGroupQuery.CREATED_ON,sortDescending);
         query.execute();
      }
      
      public static function loadFilesByViews(groupName:String, sortDescending:Boolean = true, keyName:String = null, keyValue:* = null) : void
      {
         var error:* = undefined;
         var group:SaveGroup = getSaveGroup(groupName);
         §§push(true);
         if(!group)
         {
            error = new APIError("QUERY_INCOMPLETE","The query could not be preformed, check the spelling of your save group name.");
            method_49({"command_id":"loadFilesByViews"},error);
            return;
         }
         var query:SaveGroupQuery = group.newQuery();
         if(keyName)
         {
            query.addKeyCondition(keyName,"=",keyValue);
         }
         query.sortOn(SaveGroupQuery.TOTAL_VIEWS,sortDescending);
         query.execute();
      }
      
      public static function loadFilesByRating(groupName:String, ratingName:String, sortDescending:Boolean = true, keyName:String = null, keyValue:* = null) : void
      {
         var error:* = undefined;
         var group:SaveGroup = getSaveGroup(groupName);
         if(!group)
         {
            error = new APIError("QUERY_INCOMPLETE","The query could not be preformed, check the spelling of your save group name.");
            method_49({"command_id":"loadFilesByDate"},error);
            return;
            §§push(true);
         }
         else
         {
            var query:SaveGroupQuery = group.newQuery();
            if(keyName)
            {
               query.addKeyCondition(keyName,"=",keyValue);
            }
            query.sortOnRating(ratingName,sortDescending);
            query.execute();
            return;
         }
      }
      
      public static function onRemoteAuthentication(auth_result:String) : *
      {
         var auth_data:Object = com.adobe.serialization.json.JSON.decode(RC4.decrypt(auth_result,_encryptionKey));
         user_id = auth_data.NewgroundsAPI_UserID;
         session_id = auth_data.NewgroundsAPI_SessionID;
         publisher_id = auth_data.NewgroundsAPI_PublisherID;
      }
      
      private static function method_68(e:Object) : void
      {
         var packet:Object = null;
         var user:String = null;
         var board:ScoreBoard = null;
         var results:Array = null;
         var medal:Medal = null;
         var group:SaveGroup = null;
         var bestScores:Object = null;
         var bestRanks:Object = null;
         var numScores:Object = null;
         var file:SaveFile = null;
         var i:uint = 0;
         var fileData:Object = null;
         var j:uint = 0;
         var error:APIError = null;
         var r:Object = null;
         §§push(true);
         switch(_loc21_)
         {
            case "connectMovie":
               timeoutTimer.stop();
               if(e.success)
               {
                  sendMessage("You have successfully connected to the Newgrounds API Gateway");
                  sendMessage("Movie identified as \"" + e.movie_name + "\"");
                  sendCommand("preloadSettings",{
                     "publisher_id":publisher_id,
                     "user_id":user_id
                  });
                  addr1625:
                  return;
                  §§push(true);
               }
               else
               {
                  callListener(APIEvent.API_CONNECTED,e.success,{});
                  return;
               }
            case "preloadSettings":
               if(e.medals)
               {
                  method_87(e.medals);
                  §§push(!hasUserSession());
                  §§push(!hasUserSession());
                  §§push(true);
               }
               else
               {
                  if(e.save_groups)
                  {
                     method_120(e.save_groups);
                  }
                  if(e.save_file_path)
                  {
                     _saveFilePath = e.save_file_path + "/";
                  }
                  if(e.image_file_path)
                  {
                     _imageFilePath = e.image_file_path + "/";
                  }
                  if(e.score_boards)
                  {
                     method_163(e.score_boards);
                  }
                  sendMessage("Metadata loaded!");
                  callListener(APIEvent.METADATA_LOADED,e.success);
                  §§push(Boolean(_saveFileId));
                  §§push(Boolean(_saveFileId));
               }
               §§pop();
               if(_saveGroupId)
               {
                  group = getSaveGroupById(_saveGroupId);
                  if(group)
                  {
                     callListener(APIEvent.FILE_REQUESTED,true,{
                        "save_id":_saveFileId,
                        "group":group
                     });
                  }
               }
               _preloadComplete = true;
               §§goto(addr1625);
            case "logCustomEvent":
               if(e.success)
               {
                  sendMessage("Event \'" + e.event + "\' was logged.");
               }
               callListener(APIEvent.EVENT_LOGGED,e.success,{"event":e.event});
               §§goto(addr1625);
            case "postScore":
               if(e.success)
               {
                  user = "User";
                  if(user_email)
                  {
                     user = user_email;
                  }
                  else if(user_name)
                  {
                     user = user_name;
                  }
                  board = getScoreBoardById(e.board);
                  if(board)
                  {
                     (user + " posted " + e.value + " to \'").sendMessage(true);
                     §§push();
                  }
                  if(e.best_scores)
                  {
                     bestScores = {
                        "today":e.best_scores.D,
                        "yesterday":e.best_scores.P,
                        "week":e.best_scores.W,
                        "year":e.best_scores.Y,
                        "all_time":e.best_scores.A
                     };
                  }
                  else
                  {
                     bestScores = {};
                  }
                  if(e.best_ranks)
                  {
                     bestRanks = {
                        "today":e.best_ranks.D,
                        "yesterday":e.best_ranks.P,
                        "week":e.best_ranks.W,
                        "year":e.best_ranks.Y,
                        "all_time":e.best_ranks.A
                     };
                  }
                  else
                  {
                     bestRanks = {};
                  }
                  if(e.num_scores)
                  {
                     numScores = {
                        "today":e.num_scores.D,
                        "yesterday":e.num_scores.P,
                        "week":e.num_scores.W,
                        "year":e.num_scores.Y,
                        "all_time":e.num_scores.A
                     };
                  }
                  else
                  {
                     numScores = {};
                  }
                  packet = {
                     "score":e.score,
                     "value":e.value,
                     "username":user,
                     "best_scores":bestScores,
                     "best_ranks":bestRanks,
                     "num_scores":numScores
                  };
               }
               callListener(APIEvent.SCORE_POSTED,e.success,packet);
               §§goto(addr1625);
            case "loadScores":
               packet = new Object();
               board = getScoreBoardById(e.board);
               if(board)
               {
                  board.setScores(e.scores,e.period,e.page,e.num_results,e.num_scores);
               }
               callListener(APIEvent.SCORES_LOADED,e.success,{"board":board});
               §§goto(addr1625);
            case "unlockMedal":
               if(_medals)
               {
                  medal = getMedal(e.medal_name);
                  if(medal.unlocked)
                  {
                     return;
                  }
                  medal.unlocked = true;
                  callListener(APIEvent.MEDAL_UNLOCKED,e.success,{
                     "medal_id":medal.id,
                     "medal":medal
                  });
               }
               §§goto(addr1625);
            case "getMedals":
               if(e.success)
               {
                  method_87(e.medals);
               }
               callListener(APIEvent.MEDALS_LOADED,e.success,packet);
               §§goto(addr1625);
            case "loadSaveFile":
               if(e.success)
               {
                  group = getSaveGroupById(e.group_id);
                  file = new SaveFile(group);
                  file.id = e.file.save_id;
                  file.name = e.file.filename;
                  file.fileUrl = _saveFilePath + e.file.file;
                  file.thumbnailUrl = _imageFilePath + e.file.thumb;
                  file.authorName = e.file.user_name;
                  file.authorId = e.file.user_id;
                  file.setStatus(e.file.status);
                  file.description = e.file.description;
                  file.setFileSize(e.file.file_size);
                  if(e.file.keys && e.file.keys.length)
                  {
                     i = 0;
                     if(i >= e.file.keys.length)
                     {
                        addr961:
                        file.loadContents();
                        §§push(true);
                     }
                     else
                     {
                        file.setKey(e.file.keys[i].id,e.file.keys[i].value);
                        loop1:
                        while(true)
                        {
                           i = §§pop();
                           addr948:
                           while(i < e.file.ratings.length)
                           {
                              file.setRating(e.file.ratings[i].id,e.file.ratings[i].votes,e.file.ratings[i].score);
                              §§push(i + 1);
                              continue loop1;
                           }
                        }
                        §§push(i + 1);
                        §§push(true);
                     }
                  }
                  else if(e.file.ratings && e.file.ratings.length)
                  {
                     i = 0;
                     §§goto(addr948);
                  }
                  if(e.get_contents)
                  {
                     §§goto(addr961);
                  }
               }
               save_file = file;
               callListener(APIEvent.FILE_INITIALIZED,e.success,{
                  "save_id":file.id,
                  "file":file
               });
               §§goto(addr1625);
            case "lookupSaveFiles":
               results = [];
               if(e.success && e.files)
               {
                  for(i = 0; i < e.files.length; )
                  {
                     fileData = e.files[i];
                     file = new SaveFile(getSaveGroupById(e.group_id));
                     file.name = fileData.filename;
                     file.id = fileData.save_id;
                     file.description = fileData.description;
                     for(file.thumbnailUrl = _imageFilePath + fileData.thumb; j < fileData.ratings.length; )
                     {
                        file.setRating(fileData.ratings[j].id,fileData.ratings[j].votes,fileData.ratings[j].score);
                        j++;
                     }
                     results.push(file);
                     i++;
                     §§push(true);
                  }
               }
               e.owner.setResults(results);
               e.owner.dispatchEvent(new APIEvent(APIEvent.QUERY_COMPLETE,e.success,{"query":e.owner}));
               callListener(APIEvent.QUERY_COMPLETE,e.success,{"query":e.owner});
               §§goto(addr1625);
            case "rateSaveFile":
               file = e.owner;
               e.success = e.success && !e.already_voted;
               file.setRating(e.rating_id,e.votes,e.score);
               e.file = file;
               §§push(true);
               if(e.already_voted)
               {
                  error = new APIError("PERMISSION_DENIED","You have already voted on this item today");
                  file.dispatchEvent(new APIEvent(APIEvent.VOTE_COMPLETE,e.success,{
                     "error":error,
                     "file":file,
                     "save_id":file.id
                  }));
                  callListener(APIEvent.VOTE_COMPLETE,e.success,e);
                  §§push(true);
                  §§push(true);
                  break;
               }
               r = file.getRating(e.rating_id);
               file.dispatchEvent(new APIEvent(APIEvent.VOTE_COMPLETE,e.success,{
                  "rating":r,
                  "file":file,
                  "save_id":file.id
               }));
               API.callListener(APIEvent.VOTE_COMPLETE,e.success,{
                  "rating":r,
                  "file":file,
                  "save_id":file.id
               });
               §§goto(addr1625);
            case "saveFile":
               break;
            case "checkFilePrivs":
               packet = {
                  "filename":e.filename,
                  "folder":e.folder,
                  "can_read":e.can_read,
                  "can_write":e.can_write
               };
               callListener(APIEvent.FILE_PRIVS_LOADED,e.success,packet);
               §§goto(addr1625);
            default:
               §§goto(addr1625);
         }
         packet = {};
         if(e.success)
         {
            packet = {
               "save_id":e.save_id,
               "filename":e.filename,
               "file_url":e.file_url,
               "thumbnail":e.thumbnail,
               "icon":e.icon
            };
            SaveFile(e.owner).fileSaved(packet);
         }
         e.owner.dispatchEvent(new APIEvent(APIEvent.FILE_SAVED,e.success,{
            "save_id":save_file.id,
            "file":save_file
         }));
         callListener(APIEvent.FILE_SAVED,e.success,{
            "save_id":save_file.id,
            "file":save_file
         });
         save_file = null;
         §§goto(addr1625);
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:uint = 0, useWeakReference:Boolean = false) : void
      {
         _eventDispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return _eventDispatcher.hasEventListener(type);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
      }
      
      private static function dispatchEvent(event:Event) : void
      {
         _eventDispatcher.dispatchEvent(event);
         method_63("Fired Event: " + event.type);
      }
      
      static function callListener(type:String, success:Boolean = true, data:* = undefined) : void
      {
         dispatchEvent(new APIEvent(type,success,data));
         if(_bridge)
         {
            _bridge.sendEvent(type,{
               "success":success,
               "data":data
            });
         }
      }
      
      private static function method_80(id:String) : String
      {
         return id;
      }
      
      private static function method_51(name:String) : String
      {
         return name;
      }
      
      private static function method_175() : Object
      {
         var i:String = null;
         var aliases:Object = new Object();
         for(aliases[period_aliases[i].alias] in period_aliases)
         {
         }
         return aliases;
      }
      
      public static function getPeriodName(p:String) : String
      {
         var i:* = null;
         for(i in period_aliases)
         {
            if(i == p)
            {
               return period_aliases[i].name;
            }
         }
         return null;
      }
      
      public static function getPeriodAlias(p:String) : String
      {
         var i:* = null;
         for(i in period_aliases)
         {
            if(i == p)
            {
               return period_aliases[i].alias;
            }
         }
         return null;
      }
      
      private static function method_49(c:Object, e:APIError) : void
      {
         var msg:String = "[NewgroundsAPI ERROR] :: " + method_80(c.command_id) + "() - " + e.name + ":\n\t\t\t\t" + e.message;
         trace(msg);
         true.sendEvent("trace",{"data":msg});
      }
      
      private static function method_48(m:String, c:String = null) : void
      {
         m = true;
         trace(m);
      }
      
      private static function method_124(m:String, c:String = null) : void
      {
         if(c)
         {
            m = m + ("\n[NewgroundsAPI NOTICE] :: \tSee " + COMMANDS_WIKI_URL + c.toLowerCase() + " for additional information.");
         }
         trace(m);
         if(_bridge)
         {
            _bridge.sendEvent("trace",{"data":m});
         }
      }
      
      private static function method_53(m:String, c:String) : void
      {
         m = true;
         trace("***ERROR*** class=API\n\n" + m);
      }
      
      public static function openLoginPage() : *
      {
         if(hasUserSession())
         {
            return;
         }
      }
      
      public static function sendSecureCommand(command:String, secure_params:Object, unsecure_params:Object = null, files:Object = null, owner:* = null) : void
      {
         !debugMode;
         §§push(!debugMode);
         if(!hasUserEmail())
         {
            method_49({"command_id":method_51(command)},new APIError("IDENTIFICATION_REQUIRED","You must be logged in or provide an e-mail address ( using NewgroundsAPI.setUserEmail(\"name@domain.com\"); ) to use " + command + "()."));
            §§push(true);
         }
         else
         {
            if(!command)
            {
               method_53("Missing command","sendSecureCommand");
            }
            if(secure_params)
            {
               if(!unsecure_params)
               {
                  addr110:
                  unsecure_params = new Object();
               }
            }
            var seed:String = "";
            for(var i:uint = 0; i < 16; i++)
            {
               seed = seed + compression_radix.charAt(Math.floor(Math.random() * compression_radix.length));
            }
            if(debugMode && !session_id)
            {
               secure_params.session_id = "";
            }
            else
            {
               secure_params.session_id = session_id;
            }
            secure_params.as_version = 3;
            secure_params.user_email = user_email;
            secure_params.publisher_id = publisher_id;
            secure_params.seed = seed;
            secure_params.command_id = method_51(command);
            var hash:String = MD5.hash(seed);
            var rc4enc:String = RC4.encrypt(com.adobe.serialization.json.JSON.encode(secure_params),_encryptionKey);
            var hex_value:String = hash + rc4enc;
            unsecure_params.secure = method_85(hex_value);
            secureCommand = command;
            sendCommand("securePacket",unsecure_params,false,files,owner);
            return;
            §§push(true);
            §§push(true);
         }
         method_53("Missing secure_params","sendSecureCommand");
         §§goto(addr110);
      }
      
      public static function stopPendingCommands() : void
      {
         SmartURLLoader.closeAll();
      }
      
      private static function method_245(e:Event) : void
      {
         var response:Object = null;
         var error:APIError = null;
         var loader:SmartURLLoader = SmartURLLoader(e.target);
         method_63("INPUT: \n" + loader.response + "\n");
         for(var i:uint = 0; i < _preloadAssets.length; )
         {
            if(_preloadAssets[i] == loader)
            {
               _preloadAssets.splice(i,1);
               break;
            }
            i++;
         }
         try
         {
            response = com.adobe.serialization.json.JSON.decode(loader.response);
         }
         catch(error:Error)
         {
         }
         if(!response)
         {
            response = {
               "command_id":loader._command,
               "success":false
            };
         }
         response.owner = loader.owner;
         if(!response || !response.success)
         {
            if(response.command_id == "connectMovie")
            {
               connected = false;
            }
            error = new APIError(response.error_code,response.error_msg);
            method_49(response,error);
            if(response.command_id)
            {
               method_68(response);
            }
         }
         else
         {
            method_68(response);
         }
      }
      
      private static function method_125(e:Event) : void
      {
         var response:Object = {"success":false};
         var loader:SmartURLLoader = SmartURLLoader(e.target);
         response.owner = loader.owner;
         for(var i:uint = 0; i < _preloadAssets.length; )
         {
            if(_preloadAssets[i] == loader)
            {
               _preloadAssets.splice(i,1);
               break;
            }
            i++;
         }
         if(loader._command)
         {
            response.command_id = loader._command;
            if(response.command_id == "connectMovie")
            {
               connected = false;
            }
            method_68(response);
         }
      }
      
      private static function sendCommand(command:String, params:Object, openBrowser:Boolean = false, files:Object = null, owner:* = null) : void
      {
         var msg:* = null;
         var key:* = null;
         var name:* = null;
         if(!connected && command != "connectMovie")
         {
            msg = "NewgroundsAPI." + command + "() - NewgroundsAPI.connectMovie() must be called before this command can be called\n";
            method_53(msg,"connectMovie");
         }
         var loader:SmartURLLoader = new SmartURLLoader();
         loader.addVariable("command_id",method_51(command));
         loader.addVariable("tracker_id",_movieId);
         if(debugMode)
         {
            loader.addVariable("debug",1);
         }
         if(params)
         {
            for(key in params)
            {
               loader.addVariable(key,params[key]);
            }
         }
         if(files)
         {
            for(name in files)
            {
               loader.addFile(name,files[name],name);
            }
            §§push(true);
         }
         else
         {
            if(openBrowser)
            {
               loader.method = URLRequestMethod.GET;
            }
            else
            {
               loader.method = URLRequestMethod.POST;
            }
            loader.preventCache = true;
            if(openBrowser)
            {
               loader.openBrowser = true;
               loader.method = URLRequestMethod.GET;
            }
            else
            {
               loader.addEventListener(Event.COMPLETE,method_245);
               loader.addEventListener(IOErrorEvent.IO_ERROR,method_125);
               loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,method_125);
               loader.method = URLRequestMethod.POST;
            }
            if(!params.secure)
            {
               loader._command = method_51(command);
            }
            addr310:
            loader.owner = owner;
            return;
            §§push(true);
         }
         loader._command = secureCommand;
         §§goto(addr310);
      }
      
      public static function isFlashVersion(major:uint, minor:uint = 0, buildNumber:uint = 0, internalBuildNumber:uint = 0) : Boolean
      {
         var version:Array = Capabilities.version.split(" ")[1].split(",");
         for(var requiredVersion:Array = arguments,var i:uint = 0; i < requiredVersion.length; )
         {
            version[i] = uint(version[i]);
            i++;
         }
         for(i = 0; i < requiredVersion.length; )
         {
            if(version[i] > requiredVersion[i])
            {
               return true;
            }
            if(version[i] < requiredVersion[i])
            {
               return false;
            }
            i++;
         }
         return true;
      }
      
      public static function createAd() : FlashAd
      {
         sendMessage("You may see a security sandbox violation. This is normal!");
         return new FlashAd();
      }
      
      public static function sendMessage(m:String, r:Boolean = false) : void
      {
         var msg:String = "[NewgroundsAPI] :: " + m;
         trace(msg);
         if(_bridge)
         {
            _bridge.sendEvent("trace",{"data":msg});
         }
      }
      
      private static function method_63(m:String) : void
      {
         if(do_echo)
         {
            trace(m);
         }
      }
   }
}
