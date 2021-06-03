
final class CalendarService {
    
    let repository: CalendarRepositoryProtocol
    
    init(_ repository: CalendarRepositoryProtocol) {
        self.repository = repository
    }
}
