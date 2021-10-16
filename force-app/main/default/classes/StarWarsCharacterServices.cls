public class StarWarsCharacterServices {
    public static List<StarWarsCharacter> getCharacterList() {
        System.debug('retrieving characters from swapi.dev');
        String url = 'https://swapi.dev/api/people/?format=json';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Accepts', 'application/json');
        HttpResponse response = http.send(request);
        String jsonString = response.getBody();
        System.debug(jsonString);

        List<StarWarsCharacter> searchResult = new List<StarWarsCharacter>();
        if(response.getStatusCode()==200) {
            StarWarsCharacterSearchResponse searchResponse = (StarWarsCharacterSearchResponse) System.JSON.deserialize(jsonString, StarWarsCharacterSearchResponse.class);
            if(searchResponse.count> 0) {
                for(StarWarsCharacter character : searchResponse.results) {
                    if(String.isNotEmpty(character.homeworld))
                        character.homeworld = getHomeworldName(character.homeworld);
                    searchResult.add(character);
                }
            }
        }
        return searchResult;
    }

    private static String getHomeworldname(String url) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url+'?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        return (String) results.get('name');
    }

    public class StarWarsCharacter {
        public String url;
        public String name;
        public String height;
        public String birth_year;
        public String hair_color;
        public String homeworld;
        public List<String> films;
        public List<String> starships;
    }

    public class StarWarsCharacterSearchResponse {
        public Integer count;
        public List<StarWarsCharacter> results;
    }
}
