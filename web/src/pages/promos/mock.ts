import dayjs from 'dayjs'
import { range } from 'lodash-es'

export default function mock(): model.promo.DailyBounsRecord[] {
    const now = dayjs()
    const today = now.date()
    const days = now.daysInMonth()
    const prefix = now.format('yyyy-MM-')

    return range(days).map<model.promo.DailyBounsRecord>((i) => ({
        amount: 0,
        date: prefix + i.toString().padStart(2, '0'),
        status: i < today ? 2 : i > today ? 3 : 1,
    }))
}
