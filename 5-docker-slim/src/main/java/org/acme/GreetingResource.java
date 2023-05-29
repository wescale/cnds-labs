package org.acme;

import org.jboss.resteasy.reactive.RestForm;
import org.jboss.resteasy.reactive.RestMatrix;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedHashMap;
import javax.ws.rs.core.MultivaluedMap;
import java.util.Collection;
import java.util.stream.Collectors;

@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from RESTEasy Reactive";
    }

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/say")
    public String sayHello(final MultivaluedMap<String, String> map) {
        System.out.println("Map --> " + map);
        return map.keySet().stream()
                .map(key -> String.join("=", key, String.join(",", map.get(key))))
                .collect(Collectors.joining(System.lineSeparator()));
    }
}