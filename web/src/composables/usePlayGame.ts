import useDelegate from './useDelegate'

export default function usePlayGame(souces: any[]) {
    return useDelegate(['data-game-index', 'data-fav-index'] as const, (index, attr) => {
        const data = souces[index as any]
        if (!data) return
        if (attr === 'data-fav-index') {
        } else {
        }
    })
}
 