import Vapor

/// Register your application's routes here. ets
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "metaseven domain app test"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    router.post("api", "acronyms"){ req -> Future<Acronym> in
        return try req.content.decode(Acronym.self)
            .flatMap(to: Acronym.self) { acronym in
                return acronym.save(on: req)
        }
    }
}
