function fn() {
  var env = karate.env; // get system property 'karate.env'
  var company = karate.properties["company"];

  karate.log('karate.env system property was:', env);
   karate.log('company system property was:', company);


  if (env==null) {
    env = 'uat';
  }

  if (company==null) {
      company = 'facebook';
    }

  var config = {
    env: env,
    myVarName: 'someValue',
    _url:'https://trello.com/1',
    _key:'',
    _token:'',
    _someReusableFeature:'classpath:some-reusable-feature/',
    _somePayloadJson:'classpath:some-payload-json/'
  }

  if (env == 'dev') {
    // customize
    if(company=='facebook'){
        config._url = 'https://trello.com/1';
        config._key = '38e7987a4fa0c6195e8c27df9d27c099';
        config._token = '954559eeb9747a014cc836c24676cefba91748d9fbeadb97a1af9278635cc325';
    }else if (company=='whatsapp'){
        config._url = 'https://api.trello.com/1';
        config._key = '38e7987a4fa0c6195e8c27df9d27c099';
        config._token = '954559eeb9747a014cc836c24676cefba91748d9fbeadb97a1af9278635cc325';
    }
  } else if (env == 'uat') {
    // customize
        if(company=='facebook'){
    config._url = 'https://api.trello.com/1';
    config._key = '38e7987a4fa0c6195e8c27df9d27c099';
    config._token = '954559eeb9747a014cc836c24676cefba91748d9fbeadb97a1af9278635cc325';
    }else if (company=='whatsapp'){
        config._url = 'https://trello.com/1';
            config._key = '38e7987a4fa0c6195e8c27df9d27c099';
            config._token = '954559eeb9747a014cc836c24676cefba91748d9fbeadb97a1af9278635cc325';
    }
  }

    //karate.configure("connectTimeout","60000");
    //karate.configure("readTimeout","40000");
    //karate.configure("ssl",true);
    karate.configure("logPrettyRequest",true);
    karate.configure("logPrettyResponse",true);

  return config;
}